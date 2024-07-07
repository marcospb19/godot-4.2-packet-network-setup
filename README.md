# Packet server/ setup example

This is a small example to show how you can create a client-server structure in Godot to handle raw packets.

It uses `ENet` as the networking protocol, changing to `WebRTC` or `WebSockets` might be easy (or not :skull:).

Here are the properties:

- Clients only talk to the server.
- Server automatically relays client messages.
    - Clients only talk to

## Disclaimers:

- Raw packets aren't the recommended way of handling game state.
    - Unless you have a specific reason to use raw packets, try using these first:
        - `rpc` (todo link)
        - `MultiplayerSynchronizer` (todo link)
        - `MultiplayerSpawner` (todo link)

## How to run

First, download and open the project in Godot 4.2:

```sh
git clone https://github.com/marcospb19/godot-enet-packet-server-example
cd godot-enet-packet-server-example
godot -e &> /dev/null & disown
```

Now, set it to run multiple instances:

![image](https://github.com/marcospb19/godot-enet-packet-server-example/assets/38900226/b9be23f9-593c-456e-964e-db20c1a6cfa7)

Then, press press play or F5, and you should see 4 windows:

![image](https://github.com/marcospb19/godot-enet-packet-server-example/assets/38900226/813f8d59-b9ee-41a5-afb1-103469eece46)

Start clicking on buttons and you'll see logs.

![image](https://github.com/marcospb19/godot-enet-packet-server-example/assets/38900226/b1d89eb0-05c6-462f-9b8f-fb2beac95b16)

```ruby
peer 2000: received connection signal from (peer 1)
peer 1: received connection signal from (peer 2000)
peer 3000: received connection signal from (peer 1)
peer 3000: received connection signal from (peer 2000)
peer 1: received connection signal from (peer 3000)
peer 2000: received connection signal from (peer 3000)
peer 1: received msg from peer 3000 'Hi from 3000'
peer 2000: received msg from peer 3000 'Hi from 3000'
peer 3000: received connection signal from (peer 4000)
peer 1: received connection signal from (peer 4000)
peer 4000: received connection signal from (peer 1)
peer 4000: received connection signal from (peer 2000)
peer 4000: received connection signal from (peer 3000)
peer 2000: received connection signal from (peer 4000)
peer 3000: received msg from peer 4000 'Hi from 4000'
peer 1: received msg from peer 4000 'Hi from 4000'
peer 2000: received msg from peer 4000 'Hi from 4000'
peer 3000: received msg from peer 2000 'Hi from 2000'
peer 1: received msg from peer 2000 'Hi from 2000'
peer 4000: received msg from peer 2000 'Hi from 2000'
```

(IDs are random, I edited the above for better readability).

## More docs?

My original plan is to put some of these into the docs, there are no official docs that put together an example like this.

## Open questions:

1. Is this, by default, using `ENet`'s reliable mode?

## Can I copy this?

Yeah! That's the spirit!
