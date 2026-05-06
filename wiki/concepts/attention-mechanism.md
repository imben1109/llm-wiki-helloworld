---
type: concept
domain: ai
created: 2026-05-06
updated: 2026-05-06
sources: [large-language-models-overview]
---

# Attention Mechanism

The core innovation of the [[transformer-architecture]] that allows each token in a sequence to directly attend to every other token, computing a weighted combination of information from the entire context.

## Definition

Attention takes three inputs — queries (Q), keys (K), and values (V) — and computes:

```
Attention(Q, K, V) = softmax(QK^T / sqrt(d_k)) * V
```

Where `d_k` is the key dimension used for scaling to prevent vanishing gradients in the softmax.

Intuitively: the query from a given position is compared against the keys of all positions; the resulting similarity scores (after softmax normalisation) are used as weights to blend the corresponding value vectors.

## Multi-Head Attention

**Multi-head attention** runs several attention operations in parallel, each with its own learned Q, K, V projections. The outputs are concatenated and projected back to the model dimension. This allows the model to jointly attend to information from different representation subspaces — for example, one head may track syntactic dependencies while another tracks semantic co-reference.

## Types of Attention

| Type | Description |
|------|-------------|
| **Self-attention** | Q, K, V all come from the same sequence |
| **Causal (masked) attention** | Tokens can only attend to previous positions; used in decoder-only LLMs |
| **Cross-attention** | Q comes from one sequence, K/V from another; used in encoder-decoder models |

## Complexity and Efficient Variants

Naive self-attention is **O(n²)** in memory and compute with respect to sequence length n. For long contexts this is prohibitive. Research has produced several efficient alternatives:

- **Flash Attention** — reorders computations to minimise memory reads/writes; same output as exact attention, faster in practice
- **Sparse Attention** — each token attends to only a subset of positions
- **Linear attention** — approximates the softmax kernel with linear functions to achieve O(n) complexity
- **State-space models (e.g., Mamba)** — a non-attention architecture that achieves O(n) sequence processing

## Links

- [[transformer-architecture]] — The architecture in which attention is the core sub-layer
- [[retrieval-augmented-generation]] — Uses transformer attention internally when processing retrieved context

## Sources

- [Large Language Models Overview](../sources/large-language-models-overview.md)
