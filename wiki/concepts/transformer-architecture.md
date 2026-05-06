---
type: concept
domain: ai
created: 2026-05-06
updated: 2026-05-06
sources: [large-language-models-overview]
---

# Transformer Architecture

The foundational neural network architecture underlying virtually all modern large language models, introduced by Vaswani et al. in "Attention Is All You Need" (2017). It replaced recurrent architectures with parallel, attention-based processing.

## Definition

A transformer is a deep neural network architecture composed of a stack of identical layers, each containing two sub-layers:

1. **Multi-head self-attention** — allows every position in the sequence to directly attend to every other position
2. **Position-wise feed-forward network** — applies a two-layer MLP independently to each position

Residual connections and layer normalisation are applied around each sub-layer.

## How It Works

The original transformer used an encoder-decoder design for sequence-to-sequence tasks (e.g., translation). Modern LLMs use a **decoder-only** variant where tokens attend only to previous positions (causal or autoregressive attention). This design makes the model naturally suited to next-token prediction, which is the training objective for virtually all large language models.

Key components:

- **Token embeddings** — map discrete tokens to continuous vector representations
- **Positional encodings** — inject information about token position into embeddings (originally sinusoidal; modern models often use rotary or learned encodings)
- **Causal attention mask** — prevents positions from attending to future tokens during training
- **Final linear + softmax head** — projects hidden states to vocabulary probabilities

## Why Transformers Replaced RNNs

- **Parallelism**: tokens are processed simultaneously, not sequentially — enabling efficient use of GPU/TPU hardware
- **Long-range dependencies**: direct attention connections mean distance between tokens does not limit information flow
- **Scalability**: architecture scales predictably with depth, width, and attention heads — a key requirement for scaling laws to hold

## Limitations

- **Quadratic attention cost**: the [[attention-mechanism]] scales as O(n²) with sequence length, limiting practical context windows
- **No inherent recurrence**: positional structure must be explicitly encoded
- Research into efficient variants (Flash Attention, Sparse Attention) and alternative architectures (Mamba, state-space models) addresses these limitations

## Links

- [[attention-mechanism]] — The core sub-layer that defines the transformer
- [[large-language-models-overview]] — Article from which this concept was extracted (see [[../sources/large-language-models-overview]])
- [[retrieval-augmented-generation]] — A downstream technique that leverages transformer-based LLMs
- [[llm-wiki-pattern]] — A knowledge management pattern enabled by capable transformer-based LLMs

## Sources

- [Large Language Models Overview](../sources/large-language-models-overview.md)
