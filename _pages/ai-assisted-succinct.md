---
layout: page
title: "The Receipt for a Computation"
permalink: /ai-assisted/succinct/
description: On the problem Succinct is solving.
---

_October 2026 · On the problem Succinct is solving_

<p><em>Researched and drafted with AI assistance, then reviewed by me. <a href="/ai-assisted/">← Back to AI Assisted</a></em></p>

When you show a driver's license at a bar, you prove you are over 21. But you also show your name, your birthday, and your home address. The bouncer needs one fact. You give him five.

I think most of the internet works this way. To prove one thing, we show too much. Or we skip the proof and just trust someone.

Think about what happens when a computer tells you something. Your bank says your balance is $812. You can't check the math. You trust the bank. If you don't trust the bank, you have one other option: do the whole calculation again yourself. For a bank, that is impossible. For a blockchain, it is the normal design. Thousands of computers repeat the same work just to agree that nobody cheated. It is like a restaurant where every customer goes into the kitchen and cooks the meal again before paying.

So today we have two choices. Trust an institution, or repeat the work. One costs you privacy and control. The other costs time and electricity.

There is a third choice. Mathematicians found it in the 1980s. It is called a zero-knowledge proof. Think of it as a sealed receipt for a computation. Someone does the work and gives you a small receipt. You check the receipt in a moment. If it checks out, the work was done correctly. And the receipt does not have to show the private details. It can say "over 21" without saying the birthday.

That sounds too good to be true. So why did nobody use it? Because making the receipts was miserable. You could not just write a normal program. A specialist had to translate each task by hand into a special mathematical form, called a circuit. Succinct says this used to take large teams of cryptographers months, even years. It was like hiring a watchmaker to build a new watch every time you wanted to know the time.

This is the problem Succinct, the company Uma Roy co-founded, set out to fix. Its product, SP1, is a "zkVM," a zero-knowledge virtual machine. In plain words, it is a computer that writes a receipt for everything it runs. A programmer writes ordinary code. SP1 makes the proof. Uma Roy compares it to a foundation model for cryptography: you don't build a new machine for each job. You just give it the job.

The second problem was speed. Making a proof takes much more work than doing the computation itself, often hundreds or thousands of times more. So the company built a marketplace, the Succinct Prover Network, where owners of powerful computers compete to make proofs for others and get paid in a token called PROVE. In 2025 Succinct said it could prove almost every Ethereum block in under twelve seconds, which is the time Ethereum takes to make a new one.

Who uses this? Mostly blockchains, for now. Rollups are like express lanes beside a crowded highway. They handle many transactions and report back to Ethereum. Optimism and Coinbase's Base network now use SP1 proofs to show their reports are honest. The more interesting uses are outside crypto. In March 2026, Google researchers used SP1 to prove they had found a cheaper quantum attack on common encryption, without publishing the attack. In April, Succinct released ZCAM, an iPhone camera app that signs a photo at the moment you take it. You prove a picture is real instead of guessing whether it is fake.

None of this is magic. A proof shows that a program ran correctly. It does not show that the program was correct. In April, the security firm Trail of Bits published a fake proof that "beat" Google's result. It used bugs in the program Google ran inside SP1, not a better attack. Google patched them, and its science still holds. Researchers have found bugs in SP1 too, which Succinct fixed. In October, Vitalik Buterin wrote that the race for speed is won and the top priority now is security. I think he is right.

Still, look at the shape of the thing. For most of history, to know something was true, you had two options: trust someone, or check it yourself. Proofs add a third: check it cheaply, without seeing the secrets. That matters more as AI makes fakes free. When anyone can make anything look real, "trust me" stops working. The future may belong less to whoever is most believed, and more to whoever can show the receipt.

**Sources:** [Succinct: SP1 is live](https://blog.succinct.xyz/sp1-is-live/) · [Optimism partners with Succinct](https://www.optimism.io/blog/optimism-partners-with-succinct-as-preferred-provider-to-accelerate-zk-proving-on-the-superchain) · [The Block: Base adopts Succinct](https://www.theblock.co/news/ecosystems/2026-05-04-coinbase-incubated-base-network-adopts-succincts-zero-knowledge-tech-399926) · [Succinct: Google and SP1](https://blog.succinct.xyz/google-sp1-quantum-threat/) · [Trail of Bits: forged proof](https://blog.trailofbits.com/2026/04/17/we-beat-googles-zero-knowledge-proof-of-quantum-cryptanalysis/) · [Succinct: Introducing ZCAM](https://blog.succinct.xyz/introducing-zcam/) · [The Network State Podcast #37](https://podcasts.apple.com/au/podcast/the-network-state-podcast/id1594687786?i=1000763298625)
