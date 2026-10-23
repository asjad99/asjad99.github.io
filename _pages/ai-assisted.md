---
layout: page
title: "AI Assisted"
permalink: /ai-assisted/
nav: true
nav_order: 7
description: Essays researched and drafted with AI assistance.
---

<p><em>Essays on this page were researched and drafted with help from AI, then reviewed by me.</em></p>

<hr>

## The Receipt for a Computation

_October 2026 · On the problem Succinct is solving_

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

<hr>

## Reading the Whole Letter

_October 2026 · On the problem Orchid is solving_

Every child gets a long letter from each parent. The letter is written in DNA. It has about three billion letters, and it tells the body how to build itself. Most of the time the letter is fine. Sometimes one letter is wrong, and a child is born with a disease nobody saw coming.

Here is the odd thing. Reading an adult's whole letter has been routine for years. But for an embryo, the point where the letter matters most, we mostly read a few lines.

Couples who do IVF often make several embryos. The clinic must pick one to transfer. How do they pick? Mostly by looking at the embryos under a microscope and by a test that counts chromosomes. That test reads well under one percent of the genome. It is like checking that a book has all its chapters without reading any of the pages.

That is the problem Orchid, the company Noor Siddiqui founded, works on. Orchid takes about five cells from an embryo and reads almost the whole genome. It checks for more than 1,200 diseases caused by a single broken gene. It also gives risk scores for common diseases, like some cancers or diabetes, that come from many genes acting together.

Her reason is personal. Her mother has an inherited eye disease that slowly takes away sight. Many parents of a child with a rare genetic disease had no idea they carried it. You cannot avoid a risk you don't know about.

Why didn't this exist before? Two reasons. Reading DNA used to be expensive. And five cells is a tiny amount of DNA. You must copy it many times before you can read it, and copying makes mistakes. Orchid's bet is that this can now be done well enough to be useful. Today it costs $2,500 per embryo, on top of IVF that already costs tens of thousands. About 100 US clinics offer it.

The case for it is simple, and the podcast makes it to both political sides. If you believe "my body, my choice," this is a choice. If you believe the government should stay out of private life, this is private life. Parents already pick embryos. The only question is whether they pick with more information or less.

But the critics are serious, and their worry is not only ethics. Some geneticists say copying DNA from five cells adds errors, so a healthy embryo might look sick, or the reverse. The bigger doubt is about the scores for common diseases. These scores describe groups well but predict one person poorly. A 2024 study found that different scoring methods often picked different "best" embryos. The scores also work less well for people without European ancestry, because most of the data comes from Europeans. The main US medical genetics body says the benefit is unproven. Some people see the whole idea as a step toward eugenics, which Orchid rejects.

I think the fair way to see it is this. Finding one broken gene that causes a serious disease is a real, narrow good. Ranking embryos by their chance of a common disease is a much weaker tool, and it is easy to sell it as more than it is. The danger isn't that parents get information. It is that they get numbers that look more certain than they are.

Still, notice the direction. Every tool that reads something starts out expensive, noisy and controversial, then becomes cheap and boring. If that happens here, the question won't be whether parents can read the whole letter. It will be what they choose to do with what they read.

**Sources:** [Freethink: Screening IVF embryos for 1000+ diseases](https://www.freethink.com/health/whole-genome-sequencing-for-embryos) · [CNBC: Orchid launches embryo genome test](https://www.nbcbayarea.com/news/business/money-report/reproductive-startup-launches-test-to-identify-an-embryos-genetic-defects-before-an-ivf-pregnancy-begins/3389295/) · [Washington Post: Inside the Silicon Valley push to breed super-babies](https://thenightly.com.au/society/health/the-washington-post-inside-the-silicon-valley-push-to-breed-super-babies-c-19445696) · [Scimex: Genetic risk scores for embryo selection](https://www.scimex.org/newsfeed/genetic-risk-scores-may-be-basically-worthless-for-embryo-selection) · [Exaudi: Scientific criticism of embryo selection](https://exaudi.org/scientific-criticism-of-new-method-of-embryo-selection/) · [The Network State Podcast #35](https://podcasts.apple.com/au/podcast/the-network-state-podcast/id1594687786?i=1000745466204)
