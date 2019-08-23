defmodule LiveViewDemo.GlusterTest do
  use LiveViewDemo.DataCase

  alias LiveViewDemo.Gluster

  describe "peers" do
    alias LiveViewDemo.Gluster.Peer

    @valid_attrs %{address: "some address", state: "some state"}
    @update_attrs %{address: "some updated address", state: "some updated state"}
    @invalid_attrs %{address: nil, state: nil}

    def peer_fixture(attrs \\ %{}) do
      {:ok, peer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Gluster.create_peer()

      peer
    end

    test "list_peers/0 returns all peers" do
      peer = peer_fixture()
      assert Gluster.list_peers() == [peer]
    end

    test "get_peer!/1 returns the peer with given id" do
      peer = peer_fixture()
      assert Gluster.get_peer!(peer.id) == peer
    end

    test "create_peer/1 with valid data creates a peer" do
      assert {:ok, %Peer{} = peer} = Gluster.create_peer(@valid_attrs)
      assert peer.address == "some address"
      assert peer.state == "some state"
    end

    test "create_peer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gluster.create_peer(@invalid_attrs)
    end

    test "update_peer/2 with valid data updates the peer" do
      peer = peer_fixture()
      assert {:ok, %Peer{} = peer} = Gluster.update_peer(peer, @update_attrs)
      assert peer.address == "some updated address"
      assert peer.state == "some updated state"
    end

    test "update_peer/2 with invalid data returns error changeset" do
      peer = peer_fixture()
      assert {:error, %Ecto.Changeset{}} = Gluster.update_peer(peer, @invalid_attrs)
      assert peer == Gluster.get_peer!(peer.id)
    end

    test "delete_peer/1 deletes the peer" do
      peer = peer_fixture()
      assert {:ok, %Peer{}} = Gluster.delete_peer(peer)
      assert_raise Ecto.NoResultsError, fn -> Gluster.get_peer!(peer.id) end
    end

    test "change_peer/1 returns a peer changeset" do
      peer = peer_fixture()
      assert %Ecto.Changeset{} = Gluster.change_peer(peer)
    end
  end

  describe "volumes" do
    alias LiveViewDemo.Gluster.Volume

    @valid_attrs %{arbiter_count: 42, disperse_count: 42, disperse_redundancy_count: 42, health: "some health", inodes_total: 42, inodes_used: 42, name: "some name", num_bricks: 42, num_subvols: 42, replica_count: 42, size_total: 42, size_used: 42, state: "some state", transport: "some transport", type: "some type"}
    @update_attrs %{arbiter_count: 43, disperse_count: 43, disperse_redundancy_count: 43, health: "some updated health", inodes_total: 43, inodes_used: 43, name: "some updated name", num_bricks: 43, num_subvols: 43, replica_count: 43, size_total: 43, size_used: 43, state: "some updated state", transport: "some updated transport", type: "some updated type"}
    @invalid_attrs %{arbiter_count: nil, disperse_count: nil, disperse_redundancy_count: nil, health: nil, inodes_total: nil, inodes_used: nil, name: nil, num_bricks: nil, num_subvols: nil, replica_count: nil, size_total: nil, size_used: nil, state: nil, transport: nil, type: nil}

    def volume_fixture(attrs \\ %{}) do
      {:ok, volume} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Gluster.create_volume()

      volume
    end

    test "list_volumes/0 returns all volumes" do
      volume = volume_fixture()
      assert Gluster.list_volumes() == [volume]
    end

    test "get_volume!/1 returns the volume with given id" do
      volume = volume_fixture()
      assert Gluster.get_volume!(volume.id) == volume
    end

    test "create_volume/1 with valid data creates a volume" do
      assert {:ok, %Volume{} = volume} = Gluster.create_volume(@valid_attrs)
      assert volume.arbiter_count == 42
      assert volume.disperse_count == 42
      assert volume.disperse_redundancy_count == 42
      assert volume.health == "some health"
      assert volume.inodes_total == 42
      assert volume.inodes_used == 42
      assert volume.name == "some name"
      assert volume.num_bricks == 42
      assert volume.num_subvols == 42
      assert volume.replica_count == 42
      assert volume.size_total == 42
      assert volume.size_used == 42
      assert volume.state == "some state"
      assert volume.transport == "some transport"
      assert volume.type == "some type"
    end

    test "create_volume/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gluster.create_volume(@invalid_attrs)
    end

    test "update_volume/2 with valid data updates the volume" do
      volume = volume_fixture()
      assert {:ok, %Volume{} = volume} = Gluster.update_volume(volume, @update_attrs)
      assert volume.arbiter_count == 43
      assert volume.disperse_count == 43
      assert volume.disperse_redundancy_count == 43
      assert volume.health == "some updated health"
      assert volume.inodes_total == 43
      assert volume.inodes_used == 43
      assert volume.name == "some updated name"
      assert volume.num_bricks == 43
      assert volume.num_subvols == 43
      assert volume.replica_count == 43
      assert volume.size_total == 43
      assert volume.size_used == 43
      assert volume.state == "some updated state"
      assert volume.transport == "some updated transport"
      assert volume.type == "some updated type"
    end

    test "update_volume/2 with invalid data returns error changeset" do
      volume = volume_fixture()
      assert {:error, %Ecto.Changeset{}} = Gluster.update_volume(volume, @invalid_attrs)
      assert volume == Gluster.get_volume!(volume.id)
    end

    test "delete_volume/1 deletes the volume" do
      volume = volume_fixture()
      assert {:ok, %Volume{}} = Gluster.delete_volume(volume)
      assert_raise Ecto.NoResultsError, fn -> Gluster.get_volume!(volume.id) end
    end

    test "change_volume/1 returns a volume changeset" do
      volume = volume_fixture()
      assert %Ecto.Changeset{} = Gluster.change_volume(volume)
    end
  end

  describe "subvols" do
    alias LiveViewDemo.Gluster.Subvol

    @valid_attrs %{arbiter_count: 42, disperse_count: 42, disperse_redundancy_count: 42, health: "some health", num_bricks: 42, replica_count: 42, type: "some type"}
    @update_attrs %{arbiter_count: 43, disperse_count: 43, disperse_redundancy_count: 43, health: "some updated health", num_bricks: 43, replica_count: 43, type: "some updated type"}
    @invalid_attrs %{arbiter_count: nil, disperse_count: nil, disperse_redundancy_count: nil, health: nil, num_bricks: nil, replica_count: nil, type: nil}

    def subvol_fixture(attrs \\ %{}) do
      {:ok, subvol} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Gluster.create_subvol()

      subvol
    end

    test "list_subvols/0 returns all subvols" do
      subvol = subvol_fixture()
      assert Gluster.list_subvols() == [subvol]
    end

    test "get_subvol!/1 returns the subvol with given id" do
      subvol = subvol_fixture()
      assert Gluster.get_subvol!(subvol.id) == subvol
    end

    test "create_subvol/1 with valid data creates a subvol" do
      assert {:ok, %Subvol{} = subvol} = Gluster.create_subvol(@valid_attrs)
      assert subvol.arbiter_count == 42
      assert subvol.disperse_count == 42
      assert subvol.disperse_redundancy_count == 42
      assert subvol.health == "some health"
      assert subvol.num_bricks == 42
      assert subvol.replica_count == 42
      assert subvol.type == "some type"
    end

    test "create_subvol/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gluster.create_subvol(@invalid_attrs)
    end

    test "update_subvol/2 with valid data updates the subvol" do
      subvol = subvol_fixture()
      assert {:ok, %Subvol{} = subvol} = Gluster.update_subvol(subvol, @update_attrs)
      assert subvol.arbiter_count == 43
      assert subvol.disperse_count == 43
      assert subvol.disperse_redundancy_count == 43
      assert subvol.health == "some updated health"
      assert subvol.num_bricks == 43
      assert subvol.replica_count == 43
      assert subvol.type == "some updated type"
    end

    test "update_subvol/2 with invalid data returns error changeset" do
      subvol = subvol_fixture()
      assert {:error, %Ecto.Changeset{}} = Gluster.update_subvol(subvol, @invalid_attrs)
      assert subvol == Gluster.get_subvol!(subvol.id)
    end

    test "delete_subvol/1 deletes the subvol" do
      subvol = subvol_fixture()
      assert {:ok, %Subvol{}} = Gluster.delete_subvol(subvol)
      assert_raise Ecto.NoResultsError, fn -> Gluster.get_subvol!(subvol.id) end
    end

    test "change_subvol/1 returns a subvol changeset" do
      subvol = subvol_fixture()
      assert %Ecto.Changeset{} = Gluster.change_subvol(subvol)
    end
  end

  describe "options" do
    alias LiveViewDemo.Gluster.Opton

    @valid_attrs %{name: "some name", value: "some value"}
    @update_attrs %{name: "some updated name", value: "some updated value"}
    @invalid_attrs %{name: nil, value: nil}

    def opton_fixture(attrs \\ %{}) do
      {:ok, opton} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Gluster.create_opton()

      opton
    end

    test "list_options/0 returns all options" do
      opton = opton_fixture()
      assert Gluster.list_options() == [opton]
    end

    test "get_opton!/1 returns the opton with given id" do
      opton = opton_fixture()
      assert Gluster.get_opton!(opton.id) == opton
    end

    test "create_opton/1 with valid data creates a opton" do
      assert {:ok, %Opton{} = opton} = Gluster.create_opton(@valid_attrs)
      assert opton.name == "some name"
      assert opton.value == "some value"
    end

    test "create_opton/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gluster.create_opton(@invalid_attrs)
    end

    test "update_opton/2 with valid data updates the opton" do
      opton = opton_fixture()
      assert {:ok, %Opton{} = opton} = Gluster.update_opton(opton, @update_attrs)
      assert opton.name == "some updated name"
      assert opton.value == "some updated value"
    end

    test "update_opton/2 with invalid data returns error changeset" do
      opton = opton_fixture()
      assert {:error, %Ecto.Changeset{}} = Gluster.update_opton(opton, @invalid_attrs)
      assert opton == Gluster.get_opton!(opton.id)
    end

    test "delete_opton/1 deletes the opton" do
      opton = opton_fixture()
      assert {:ok, %Opton{}} = Gluster.delete_opton(opton)
      assert_raise Ecto.NoResultsError, fn -> Gluster.get_opton!(opton.id) end
    end

    test "change_opton/1 returns a opton changeset" do
      opton = opton_fixture()
      assert %Ecto.Changeset{} = Gluster.change_opton(opton)
    end
  end

  describe "bricks" do
    alias LiveViewDemo.Gluster.Brick

    @valid_attrs %{block_size: 42, device: "some device", fs: "some fs", inodes_total: 42, inodes_used: 42, mount_options: "some mount_options", path: "some path", pid: 42, port: 42, size_total: 42, size_used: 42, state: "some state"}
    @update_attrs %{block_size: 43, device: "some updated device", fs: "some updated fs", inodes_total: 43, inodes_used: 43, mount_options: "some updated mount_options", path: "some updated path", pid: 43, port: 43, size_total: 43, size_used: 43, state: "some updated state"}
    @invalid_attrs %{block_size: nil, device: nil, fs: nil, inodes_total: nil, inodes_used: nil, mount_options: nil, path: nil, pid: nil, port: nil, size_total: nil, size_used: nil, state: nil}

    def brick_fixture(attrs \\ %{}) do
      {:ok, brick} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Gluster.create_brick()

      brick
    end

    test "list_bricks/0 returns all bricks" do
      brick = brick_fixture()
      assert Gluster.list_bricks() == [brick]
    end

    test "get_brick!/1 returns the brick with given id" do
      brick = brick_fixture()
      assert Gluster.get_brick!(brick.id) == brick
    end

    test "create_brick/1 with valid data creates a brick" do
      assert {:ok, %Brick{} = brick} = Gluster.create_brick(@valid_attrs)
      assert brick.block_size == 42
      assert brick.device == "some device"
      assert brick.fs == "some fs"
      assert brick.inodes_total == 42
      assert brick.inodes_used == 42
      assert brick.mount_options == "some mount_options"
      assert brick.path == "some path"
      assert brick.pid == 42
      assert brick.port == 42
      assert brick.size_total == 42
      assert brick.size_used == 42
      assert brick.state == "some state"
    end

    test "create_brick/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gluster.create_brick(@invalid_attrs)
    end

    test "update_brick/2 with valid data updates the brick" do
      brick = brick_fixture()
      assert {:ok, %Brick{} = brick} = Gluster.update_brick(brick, @update_attrs)
      assert brick.block_size == 43
      assert brick.device == "some updated device"
      assert brick.fs == "some updated fs"
      assert brick.inodes_total == 43
      assert brick.inodes_used == 43
      assert brick.mount_options == "some updated mount_options"
      assert brick.path == "some updated path"
      assert brick.pid == 43
      assert brick.port == 43
      assert brick.size_total == 43
      assert brick.size_used == 43
      assert brick.state == "some updated state"
    end

    test "update_brick/2 with invalid data returns error changeset" do
      brick = brick_fixture()
      assert {:error, %Ecto.Changeset{}} = Gluster.update_brick(brick, @invalid_attrs)
      assert brick == Gluster.get_brick!(brick.id)
    end

    test "delete_brick/1 deletes the brick" do
      brick = brick_fixture()
      assert {:ok, %Brick{}} = Gluster.delete_brick(brick)
      assert_raise Ecto.NoResultsError, fn -> Gluster.get_brick!(brick.id) end
    end

    test "change_brick/1 returns a brick changeset" do
      brick = brick_fixture()
      assert %Ecto.Changeset{} = Gluster.change_brick(brick)
    end
  end
end
