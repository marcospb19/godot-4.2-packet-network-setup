# `ENet` raw packet server/client example

A code sample to show how to setup an `ENet` client-server handle raw packets.

- Godot 4.2.
- Clients can only speak directly to the server.
- Server broadcasts messages to everyone.
- Clients receive a signal when other peers connect.

## Disclaimers:

- Raw packets aren't the recommended way of handling game state.
    - Unless you have a specific reason to use raw packets, try these first:
        - [`@rpc`](https://docs.godotengine.org/en/4.2/tutorials/networking/high_level_multiplayer.html#remote-procedure-calls)
        - [`MultiplayerSynchronizer`](https://docs.godotengine.org/en/stable/classes/class_multiplayersynchronizer.html)
        - [`MultiplayerSpawner`](https://docs.godotengine.org/en/stable/classes/class_multiplayerspawner.html)
- No encryption.
- No authorization.
- No port forwarding.

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
peer 2000: connected to peer 1
peer 1   : connected to peer 2000
peer 3000: connected to peer 1
peer 3000: connected to peer 2000
peer 1   : connected to peer 3000
peer 2000: connected to peer 3000
peer 1   : received msg from peer 3000: 'Hi from 3000'
peer 2000: received msg from peer 3000: 'Hi from 3000'
peer 3000: connected to peer 4000
peer 1   : connected to peer 4000
peer 4000: connected to peer 1
peer 4000: connected to peer 2000
peer 4000: connected to peer 3000
peer 2000: connected to peer 4000
peer 3000: received msg from peer 4000: 'Hi from 4000'
peer 1   : received msg from peer 4000: 'Hi from 4000'
peer 2000: received msg from peer 4000: 'Hi from 4000'
peer 3000: received msg from peer 2000: 'Hi from 2000'
peer 1   : received msg from peer 2000: 'Hi from 2000'
peer 4000: received msg from peer 2000: 'Hi from 2000'
```

(IDs are random, I edited the above for better readability).

## More docs?

My plan is to put some of these into the docs, there are no official docs that put together an example like this.

## Open questions:

1. Is this, by default, using `ENet`'s reliable mode?
2. How hard is to change this from `Enet` to `WebRTC` or `WS`?

## Can I copy this?

Yeah! That's the spirit!
