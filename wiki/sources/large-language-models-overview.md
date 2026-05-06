---
type: source
format: article
raw_path: raw/articles/large-language-models-overview.xml
ingested: 2026-05-06
---

# Large Language Models: Architecture, Key Models, and Scaling

## Summary

This article provides a technical overview of large language models (LLMs): the neural network architectures that underpin them, the major model families from leading AI organisations, scaling laws that govern their development, and key challenges in the field.

The foundational architecture is the transformer, introduced in 2017, which uses a self-attention mechanism to process tokens in parallel. Modern LLMs use a decoder-only variant that predicts the next token autoregressively. Attention allows every token to directly attend to all previous tokens, enabling long-range dependency modelling that earlier recurrent architectures struggled with.

The article surveys the four dominant LLM families: GPT (OpenAI), Claude (Anthropic), Gemini (Google DeepMind), and LLaMA (Meta AI), each representing a distinct approach to training, alignment, and open vs. closed release. It also covers scaling laws — the power-law relationships between model size, data, and compute — and modern training pipelines that combine pre-training, supervised fine-tuning, and reinforcement learning from human feedback (RLHF).

## Key Takeaways

- The [[transformer-architecture]] is the foundational architecture for virtually all modern LLMs
- The [[attention-mechanism]] enables each token to attend to all previous tokens in O(n²) time — this quadratic cost drives research into efficient variants
- Decoder-only transformers trained with causal (autoregressive) attention are the dominant LLM design
- The Chinchilla scaling laws show compute-optimal training requires ~20 tokens per parameter
- The four dominant LLM families are GPT ([[openai]]), Claude ([[anthropic]]), Gemini (Google DeepMind), and LLaMA (Meta AI)
- Hallucination, alignment, and context-length limits are the three central challenges for LLMs
- [[retrieval-augmented-generation]] is one mitigation strategy for hallucination

## Entities Mentioned

- [[openai]] — Developer of the GPT series; introduced InstructGPT and ChatGPT
- [[anthropic]] — Developer of Claude; created Constitutional AI alignment technique
- [[andrej-karpathy]] — Created nanoGPT educational project; "Neural Networks: Zero to Hero" lecture series

## Concepts Mentioned

- [[transformer-architecture]] — The foundational neural network architecture for LLMs
- [[attention-mechanism]] — Core innovation of the transformer; enables direct token-to-token interaction
- [[retrieval-augmented-generation]] — Contrasted as a hallucination mitigation approach
- [[llm-wiki-pattern]] — Context for LLM capabilities referenced in use-case framing

## Notable Quotes

> "Scaling laws allow practitioners to predict model performance before training."

> "Compute-optimal training requires roughly 20 tokens of training data per model parameter."
