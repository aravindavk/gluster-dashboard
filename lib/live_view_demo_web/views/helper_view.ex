defmodule LiveViewDemoWeb.HelperView do
  import Phoenix.HTML

  def volume_status(volume) do
    status_suffix =
    if volume.state == "Started" do
      ", " <> volume.health
    else
      ", -"
    end
    volume.state <> status_suffix
  end

  def peer_state_htmlclass(peer) do
    case peer.state do
      "Online" -> "peer-state-online"
      _ -> "peer-state-offline"
    end
  end

  def brick_state_htmlclass(brick) do
    case brick.state do
      "up" -> "brick-state-online"
      _ -> "brick-state-offline"
    end
  end

  def volume_state_htmlclass(volume) do
    if volume.state == "Started" do
        case volume.health do
          "partial" -> "volume-state-partial"
          "degraded" -> "volume-state-degraded"
          "down" -> "volume-state-down"
          _ -> "volume-state-up"
        end
    else
      "volume-state-stopped"
    end
  end

  defp float_to_string(val) do
    val
    |> Float.round(1)
    |> Float.to_string
  end

  defp human_readable(input_size, raw) do
    kib = 1024
    mib = 1024 * kib
    gib = 1024 * mib
    tib = 1024 * gib
    pib = 1024 * tib
    eib = 1024 * pib
    zib = 1024 * eib
    yib = 1024 * zib

    if raw or input_size < 1024 do
      input_size
    else
      cond do
        (input_size < mib) -> float_to_string(input_size/kib) <> " KiB"
        (input_size < gib) -> float_to_string(input_size/mib) <> " MiB"
        (input_size < tib) -> float_to_string(input_size/gib) <> " GiB"
        (input_size < pib) -> float_to_string(input_size/tib) <> " TiB"
        (input_size < eib) -> float_to_string(input_size/pib) <> " PiB"
        (input_size < zib) -> float_to_string(input_size/eib) <> " EiB"
        (input_size < yib) -> float_to_string(input_size/zib) <> " ZiB"
        true -> float_to_string(input_size/yib) <> " YiB"
      end
    end
  end

  def utilization(used_value, total_value, raw) do
    if total_value <= 0 do
      "-"
    else
      valueP = trunc(used_value * 100 / total_value)
      classname = "utilization-above-" <> Integer.to_string(valueP - rem(valueP, 10))
      v1 = human_readable(used_value, raw)
      v2 = human_readable(total_value, raw)
      ~E"""
      <div>
      <span class="utilization-p-text"><%= valueP %> %</span>
      <div class="utilization-container">
      <div class="utilization-value <%= classname %>" style="width: <%= valueP %>%">
      </div>
      </div>
      <span class="utilization-text">
      <%= v1 %> / <%= v2 %>
      </span>
      </div>
      """
    end
  end

  def get_volume_type_details(volume) do
    cond do
      # (volume.arbiter_count > 0) -> "Replica: " <> Integer.to_string(volume.replica_count) <> " Arbiter: " <> Integer.to_string(volume.arbiter_count)
      (volume.replica_count > 1) -> "Replica: " <> Integer.to_string(volume.replica_count)
      # (volume.disperse_count > 1) -> "Disperse: " <> Integer.to_string(volume.disperse_count)
      true -> ""
    end
  end

  def get_subvol_details(volume) do
    "Subvolumes: " <> (volume.num_subvols |> Integer.to_string) <> " Bricks: " <> (volume.num_bricks |> Integer.to_string)
  end

  def top_summary(counts, obj) do
    import Timex.Timezone

    ~E"""
    <%= if obj != nil do %>
    <div class="last-synced-msg">
        Last updated <strong><%= convert(obj.updated_at, local()) |> Calendar.Strftime.strftime!("%b %d, %Y %l:%M %P") %></strong>
    </div>
    <% end %>
    <div>
    <div class="summary-box">
    Number of Volumes <span class="box-value"><%= counts.volumes %></span>
    </div>
    <div class="summary-box">
    Number of Peers <span class="box-value"><%= counts.peers %></span>
    </div>
    <div class="summary-box">
    Number of Bricks <span class="box-value"><%= counts.bricks %></span>
    </div>
    </div>
    """
  end

end

