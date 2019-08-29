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

  def get_volume_by_name(volname) do
    Repo.get_by(Volume, name: volname)
    |> Repo.preload([:subvols, [bricks: :peers], :options])
  end

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

  alias LiveViewDemo.Gluster.Option

  @doc """
  Returns the list of options.

  ## Examples

      iex> list_options()
      [%Option{}, ...]

  """
  def list_options do
    Repo.all(Option)
  end

  @doc """
  Gets a single option.

  Raises `Ecto.NoResultsError` if the Option does not exist.

  ## Examples

      iex> get_option!(123)
      %Option{}

      iex> get_option!(456)
      ** (Ecto.NoResultsError)

  """
  def get_option!(id), do: Repo.get!(Option, id)

  @doc """
  Creates a option.

  ## Examples

      iex> create_option(%{field: value})
      {:ok, %Option{}}

      iex> create_option(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_option(attrs \\ %{}) do
    %Option{}
    |> Option.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a option.

  ## Examples

      iex> update_option(option, %{field: new_value})
      {:ok, %Option{}}

      iex> update_option(option, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_option(%Option{} = option, attrs) do
    option
    |> Option.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Option.

  ## Examples

      iex> delete_option(option)
      {:ok, %Option{}}

      iex> delete_option(option)
      {:error, %Ecto.Changeset{}}

  """
  def delete_option(%Option{} = option) do
    Repo.delete(option)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking option changes.

  ## Examples

      iex> change_option(option)
      %Ecto.Changeset{source: %Option{}}

  """
  def change_option(%Option{} = option) do
    Option.changeset(option, %{})
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
    |> Repo.preload([:volumes, :peers])
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

  def get_counts() do
    %{
      volumes: Repo.one(from v in "volumes", select: count(v.id)),
      peers: Repo.one(from p in "peers", select: count(p.id)),
      bricks: Repo.one(from b in "bricks", select: count(b.id))
    }
  end

  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(LiveViewDemo.PubSub, @topic)
  end

  def broadcast_change(event) do
    Phoenix.PubSub.broadcast(LiveViewDemo.PubSub, @topic, {__MODULE__, event})

    {:ok, %{}}
  end

  def delete_all do
    Repo.delete_all(Brick)
    Repo.delete_all(Option)
    Repo.delete_all(Subvol)
    Repo.delete_all(Volume)
    Repo.delete_all(Peer)
  end

end
