**Clustering results.** With k ∈ {2,3,4}, the Adjusted Rand Index (ARI) peaks near k=3
(ARI ≈ 0.701), matching the known three Iris species.
The elbow curve shows a clear bend at k≈3, indicating diminishing returns in within-cluster
variance beyond that point. The k=3 scatter (petal length vs petal width) separates Setosa
well, while Versicolor and Virginica partially overlap—consistent with classic findings for
this dataset. Because we used Min–Max scaled features, distance-based clustering treats all
dimensions comparably, avoiding dominance by high-variance features.

**Interpretation.** The clusters align closely with biological species, suggesting the feature
set is informative. Mis-clustered points are likely near the Versicolor–Virginica boundary,
where petal measurements overlap; adding more features (e.g., texture) or using Gaussian
mixture models might improve boundaries. In practice, a similar workflow supports
unsupervised QA, fast labeling, or first-pass customer segmentation: pick k via elbow,
quantify agreement with ARI when labels exist, then visualize feature pairs to understand
group separation and ambiguous regions.