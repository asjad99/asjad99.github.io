---
layout: page
title: "AI Capability Comparison"
permalink: /knowledge-base/ai-capability-comparison/
description: Where to compare AI models, who to read to keep up, and how to read a leaderboard without being fooled.
---

_October 2026 · Keeping up with AI progress_

<p><em>Researched and drafted with AI assistance, then reviewed by me. <a href="/knowledge-base/">← Back to Knowledge Base</a></em></p>

A new AI model comes out almost every week, and each one claims to be the best. You cannot test them all yourself. So it helps to know a few places that do the testing, and a few people who explain what changed. These are the ones I check.

### Leaderboards: who is ahead, and at what?

- **[ModelCompare](https://www.modelcompare.ai/blog)**: sends the same prompts to many models and writes up how the answers, costs and speed differ. Good for concrete, readable comparisons, such as which models make things up or flatter you most. It also keeps a daily log of model updates.
- **[LMArena](https://lmarena.ai/leaderboard)** (formerly Chatbot Arena): people ask a question, get two anonymous answers and vote for the better one. Millions of votes become a ranking. It measures what people *prefer*, with separate tables for coding, writing and other tasks.
- **[Artificial Analysis](https://artificialanalysis.ai/models)**: compares hundreds of models on quality, speed, delay and price in one place. The best page for "which model gives me the most for my money?"
- **[Epoch AI Benchmarks](https://epoch.ai/benchmarks)**: an independent research group's database of results on hard tests. Its Capabilities Index combines many benchmarks into one long-term trend line. Best for the big picture: how fast is AI improving?
- **[METR](https://metr.org/)**: measures the "time horizon" of AI agents: how long a task (timed by how long it takes a skilled human) an agent can finish on its own about half the time. A useful way to track agents, not just chatbots.

### People and newsletters: what changed, and does it matter?

- **[Simon Willison's Weblog](https://simonwillison.net/)**: a well-known developer who tries new models on the day they ship and writes about them in plain, honest terms. Posts most days. Very good on coding agents, AI security and prompt injection.
- **[Deep Learning Weekly](https://www.deeplearningweekly.com/)**: a weekly email (about 244,000 subscribers) that rounds up research, tools and industry news. Good if you want one digest a week instead of a daily feed.

### How to read a leaderboard without being fooled

1. **Ask what is being measured.** Votes measure preference, which can reward a confident, well-formatted answer over a correct one. Benchmarks measure narrow skills.
2. **Watch for teaching to the test.** If test questions leak into a model's training data, its scores rise without the model getting smarter.
3. **Big labs have an edge.** A 2025 study, "The Leaderboard Illusion", found that large providers got more data from LMArena and could test private versions and publish only their best one.
4. **Small gaps are noise.** A few points between the top models often mean nothing for your work.
5. **Test on your own task.** Ten of your real prompts tell you more than any table. The leaderboards above narrow the list; your own test makes the choice.

**Sources:** [ModelCompare blog](https://www.modelcompare.ai/blog) · [Deep Learning Weekly](https://www.deeplearningweekly.com/) · [Simon Willison's Weblog](https://simonwillison.net/) · [Epoch AI Benchmarks](https://epoch.ai/benchmarks) · [Contrary Research: LMArena](https://research.contrary.com/company/lmarena) · [Fast.io: AI model comparison tools 2026](https://www.fast.io/resources/best-ai-model-comparison-tools-2026/) · [Singh et al., "The Leaderboard Illusion" (2025)](https://arxiv.org/abs/2504.20879)
