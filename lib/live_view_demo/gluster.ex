defmodule LiveViewDemo.Gluster do
  @moduledoc """
  The Gluster context.
  """

  import Ecto.Query, warn: false
  alias LiveViewDemo.Repo

  alias LiveViewDemo.Gluster.Peer

  @doc """
  Returns the list of peers.

  ## Examples

      iex> list_peers()
      [%Peer{}, ...]

  """
  def list_peers do
    Repo.all(Peer)
  end

  @doc """
  Gets a single peer.

  Raises `Ecto.NoResultsError` if the Peer does not exist.

  ## Examples

      iex> get_peer!(123)
      %Peer{}

      iex> get_peer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_peer!(id), do: Repo.get!(Peer, id)

  @doc """
  Creates a peer.

  ## Examples

      iex> create_peer(%{field: value})
      {:ok, %Peer{}}

      iex> create_peer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_peer(attrs \\ %{}) do
    %Peer{}
    |> Peer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a peer.

  ## Examples

      iex> update_peer(peer, %{field: new_value})
      {:ok, %Peer{}}

      iex> update_peer(peer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_peer(%Peer{} = peer, attrs) do
    peer
    |> Peer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Peer.

  ## Examples

      iex> delete_peer(peer)
      {:ok, %Peer{}}

      iex> delete_peer(peer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_peer(%Peer{} = peer) do
    Repo.delete(peer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking peer changes.

  ## Examples

      iex> change_peer(peer)
      %Ecto.Changeset{source: %Peer{}}

  """
  def change_peer(%Peer{} = peer) do
    Peer.changeset(peer, %{})
  end

  @doc """
  Creates or updates a peer.

  ## Examples

      iex> create_or_update_peer(%{field: value})
      {:ok, %Peer{}}

      iex> create_or_update_peer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_or_update_peer(attrs \\ %{}) do
    result =
      case Repo.get(Peer, attrs["id"]) do
        nil  -> %Peer{}
        peer -> peer
      end
      |> Peer.changeset(attrs)
      |> Repo.insert_or_update
  end

  alias LiveViewDemo.Gluster.Volume

  @doc """
  Returns the list of volumes.

  ## Examples

      iex> list_volumes()
      [%Volume{}, ...]

  """
  def list_volumes do
    Repo.all(Volume)
  end

  @doc """
  Gets a single volume.

  Raises `Ecto.NoResultsError` if the Volume does not exist.

  ## Examples

      iex> get_volume!(123)
      %Volume{}

      iex> get_volume!(456)
      ** (Ecto.NoResultsError)

  """
  def get_volume!(id), do: Repo.get!(Volume, id)

  @doc """
  Creates a volume.

  ## Examples

      iex> create_volume(%{field: value})
      {:ok, %Volume{}}

      iex> create_volume(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_volume(attrs \\ %{}) do
    %Volume{}
    |> Volume.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a volume.

  ## Examples

      iex> update_volume(volume, %{field: new_value})
      {:ok, %Volume{}}

      iex> update_volume(volume, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_volume(%Volume{} = volume, attrs) do
    volume
    |> Volume.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Volume.

  ## Examples

      iex> delete_volume(volume)
      {:ok, %Volume{}}

      iex> delete_volume(volume)
      {:error, %Ecto.Changeset{}}

  """
  def delete_volume(%Volume{} = volume) do
    Repo.delete(volume)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking volume changes.

  ## Examples

      iex> change_volume(volume)
      %Ecto.Changeset{source: %Volume{}}

  """
  def change_volume(%Volume{} = volume) do
    Volume.changeset(volume, %{})
  end

  @doc """
  Creates or updates a volume.

  ## Examples

      iex> create_or_update_volume(%{field: value})
      {:ok, %Volume{}}

      iex> create_or_update_volume(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_or_update_volume(attrs \\ %{}) do
    result =
      case Repo.get(Volume, attrs["id"]) do
        nil  -> %Volume{}
        volume -> volume
      end
      |> Volume.changeset(attrs)
      |> Repo.insert_or_update
  end

  alias LiveViewDemo.Gluster.Subvol

  @doc """
  Returns the list of subvols.

  ## Examples

      iex> list_subvols()
      [%Subvol{}, ...]

  """
  def list_subvols do
    Repo.all(Subvol)
  end

  @doc """
  Gets a single subvol.

  Raises `Ecto.NoResultsError` if the Subvol does not exist.

  ## Examples

      iex> get_subvol!(123)
      %Subvol{}

      iex> get_subvol!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subvol!(id), do: Repo.get!(Subvol, id)

  @doc """
  Creates a subvol.

  ## Examples

      iex> create_subvol(%{field: value})
      {:ok, %Subvol{}}

      iex> create_subvol(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_subvol(attrs \\ %{}) do
    %Subvol{}
    |> Subvol.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subvol.

  ## Examples

      iex> update_subvol(subvol, %{field: new_value})
      {:ok, %Subvol{}}

      iex> update_subvol(subvol, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subvol(%Subvol{} = subvol, attrs) do
    subvol
    |> Subvol.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Subvol.

  ## Examples

      iex> delete_subvol(subvol)
      {:ok, %Subvol{}}

      iex> delete_subvol(subvol)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subvol(%Subvol{} = subvol) do
    Repo.delete(subvol)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subvol changes.

  ## Examples

      iex> change_subvol(subvol)
      %Ecto.Changeset{source: %Subvol{}}

  """
  def change_subvol(%Subvol{} = subvol) do
    Subvol.changeset(subvol, %{})
  end

  @doc """
  Creates or updates a subvol.

  ## Examples

      iex> create_or_update_subvol(%{field: value})
      {:ok, %Subvol{}}

      iex> create_or_update_subvol(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_or_update_subvol(attrs \\ %{}) do
    result =
      case Repo.get(Subvol, attrs["id"]) do
        nil  -> %Subvol{}
        subvol -> subvol
      end
      |> Subvol.changeset(attrs)
      |> Repo.insert_or_update
  end

  alias LiveViewDemo.Gluster.Opton

  @doc """
  Returns the list of options.

  ## Examples

      iex> list_options()
      [%Opton{}, ...]

  """
  def list_options do
    Repo.all(Opton)
  end

  @doc """
  Gets a single opton.

  Raises `Ecto.NoResultsError` if the Opton does not exist.

  ## Examples

      iex> get_opton!(123)
      %Opton{}

      iex> get_opton!(456)
      ** (Ecto.NoResultsError)

  """
  def get_opton!(id), do: Repo.get!(Opton, id)

  @doc """
  Creates a opton.

  ## Examples

      iex> create_opton(%{field: value})
      {:ok, %Opton{}}

      iex> create_opton(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_opton(attrs \\ %{}) do
    %Opton{}
    |> Opton.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a opton.

  ## Examples

      iex> update_opton(opton, %{field: new_value})
      {:ok, %Opton{}}

      iex> update_opton(opton, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_opton(%Opton{} = opton, attrs) do
    opton
    |> Opton.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Opton.

  ## Examples

      iex> delete_opton(opton)
      {:ok, %Opton{}}

      iex> delete_opton(opton)
      {:error, %Ecto.Changeset{}}

  """
  def delete_opton(%Opton{} = opton) do
    Repo.delete(opton)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking opton changes.

  ## Examples

      iex> change_opton(opton)
      %Ecto.Changeset{source: %Opton{}}

  """
  def change_opton(%Opton{} = opton) do
    Opton.changeset(opton, %{})
  end

  @doc """
  Creates or updates a option.

  ## Examples

      iex> create_or_update_option(%{field: value})
      {:ok, %Option{}}

      iex> create_or_update_option(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_or_update_option(attrs \\ %{}) do
    result =
      case Repo.get_by(Opton, [name: attrs["name"], volume_id: attrs["volume_id"]]) do
        nil  -> %Opton{}
        opt -> opt
      end
      |> Opton.changeset(attrs)
      |> Repo.insert_or_update
  end

  alias LiveViewDemo.Gluster.Brick

  @doc """
  Returns the list of bricks.

  ## Examples

      iex> list_bricks()
      [%Brick{}, ...]

  """
  def list_bricks do
    Repo.all(Brick)
  end

  @doc """
  Gets a single brick.

  Raises `Ecto.NoResultsError` if the Brick does not exist.

  ## Examples

      iex> get_brick!(123)
      %Brick{}

      iex> get_brick!(456)
      ** (Ecto.NoResultsError)

  """
  def get_brick!(id), do: Repo.get!(Brick, id)

  @doc """
  Creates a brick.

  ## Examples

      iex> create_brick(%{field: value})
      {:ok, %Brick{}}

      iex> create_brick(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_brick(attrs \\ %{}) do
    %Brick{}
    |> Brick.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a brick.

  ## Examples

      iex> update_brick(brick, %{field: new_value})
      {:ok, %Brick{}}

      iex> update_brick(brick, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_brick(%Brick{} = brick, attrs) do
    brick
    |> Brick.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Brick.

  ## Examples

      iex> delete_brick(brick)
      {:ok, %Brick{}}

      iex> delete_brick(brick)
      {:error, %Ecto.Changeset{}}

  """
  def delete_brick(%Brick{} = brick) do
    Repo.delete(brick)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking brick changes.

  ## Examples

      iex> change_brick(brick)
      %Ecto.Changeset{source: %Brick{}}

  """
  def change_brick(%Brick{} = brick) do
    Brick.changeset(brick, %{})
  end

  @doc """
  Creates or updates a brick.

  ## Examples

      iex> create_or_update_brick(%{field: value})
      {:ok, %Brick{}}

      iex> create_or_update_brick(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_or_update_brick(attrs \\ %{}) do
    result =
      case Repo.get_by(Brick, [peer_id: attrs["peer_id"], path: attrs["path"], volume_id: attrs["volume_id"]]) do
        nil  -> %Brick{}
        brick -> brick
      end
      |> Brick.changeset(attrs)
      |> Repo.insert_or_update
  end
end
