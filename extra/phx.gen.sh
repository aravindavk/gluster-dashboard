# Peers Schema
mix phx.gen.context Gluster Peer peers peerid:string address:string state:string

# Volumes Schema
mix phx.gen.context Gluster Volume volumes \
    volid:string \
    name:string \
    type:string \
    state:string \
    health:string \
    num_subvols:integer \
    num_bricks:integer \
    replica_count:integer \
    arbiter_count:integer \
    disperse_count:integer \
    disperse_redundancy_count:integer \
    transport:string \
    size_total:integer \
    size_used:integer \
    inodes_total:integer \
    inodes_used:integer

# Subvols Schema
mix phx.gen.context Gluster Subvol subvols \
    volume_id:references:volumes \
    name:string \
    health:string \
    replica_count:integer \
    arbiter_count:integer \
    disperse_count:integer \
    disperse_redundancy_count:integer \
    type:string \
    num_bricks:integer

# Options Schema
mix phx.gen.context Gluster Opton options \
    volume_id:references:volumes \
    name:string \
    value:string

# Bricks Schema
mix phx.gen.context Gluster Brick bricks \
    volume_id:references:volumes \
    subvol_id:references:subvols \
    peer_id:references:peers \
    path:string \
    state:string \
    fs:string \
    device:string \
    mount_options:string \
    block_size:integer \
    size_total:integer \
    size_used:integer \
    inodes_total:integer \
    inodes_used:integer \
    pid:integer \
    port:integer
