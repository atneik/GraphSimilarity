GraphSimilarity
===============
Similarity Flooding
A Versatile Graph Matching Algorithm
Introduction & Motivation
Goal: matching elements of related, complex objects
Matching elements of two data schemes
Matching elements of two data instances
Looking for a generic algorithm with wide applicability

Applications
Comparing data schemes:
Items from different shopping sites
Merger between two corporations : consolidate their relational databases deployed by different departments
Preparation of data for data warehousing and analyzing processes
In a scenario where program scripts that have been independently modified by several developers, matching helps identify moved or modified elements in these complex data structures
Comparing data instances:
Bio-informatics
Collaboration: allowing multiple users to edit a program / system
Algorithm Framework
Input: two objects to match
Representation of objects as graphs:
 G1=(V1, E1), G2=(V2, E2)
Matching between graphs gives mapping:
V1xV2 
Filtering of mapping to obtain meaningful match
Output: mapping between elements of input objects
  Human verification sometimes required
Input  Graph  Mapping  Filtering
Input are two objects to be matched
Match will be between sub-elements of the two objects
Match of sub-elements will be scored. High scores indicate a strong similarity
Assumption: Objects can be represented as graphs

Input  Graph  Mapping  Filtering
Represent objects as directed, labeled graphs
Choose any sensible graph representation (this is domain-specific) that maintains structural information
Structural information in graphs will be used for mapping. 
Intuition: similar elements have similar neighbors
G1 = (V1, E1), G2 = (V2, E2)
Input  Graph  Mapping  Filtering
We want a mapping :V1xV2  
Convenient to normalize such that 0 (v,u) 1
Begin with initial mapping function:
Null function: (v, u) := 1 for all v in V1, u in V2
String Matching function
Other domain-specific function
Perform an iterative fixpoint calculation. Each iteration floods the similarity value (v,u) to the neighbors of v and u
Input  Graph  Mapping  Filtering
We have a mapping  :V1xV2  
Result of iterations is a mapping  between all pairs in V1 and V2. We usually want much less information!
Filtering will remove pairs, leaving us with only the interesting ones
There are many ways to filter. Filter choice is domain-specific

Filtering
Possible filtering directions:
Remove uninteresting pairs according to domain-specific knowledge (e.g. ‘column’, ‘table’, ‘string’ from SQL matches) and typing information.
Cardinality considerations: do we want a 1:1 mapping? A n:m mapping?
Threshold: remove matches with low scores
Example: Relational Schemas
Scenario: two relational schemas that describe similar or same data
Goal: match elements of two given relational schemas
Input: SQL statements for creating each scheme
Desired output: a meaningful mapping between the elements of the two schemas

Similarity Flooding Calculation
Start with directed, labeled graphs A, B
Every edge e in a graph is represented by a triplet (s,p,o): edge labeled p from s to o
Define pairwise connectivity graph PCG(A, B):
Similarity Flooding Calculation
Similarity Flooding Calculation
Induced Propagation Graph: add edges in opposite direction
Edge weights: propagation coefficients. They measure how the similarity propagates to neighbors

Similarity Flooding Calculation
Similarity Flooding Calculation
Similarity measure (x,y)0 for all xA and bB. We also call  a “mapping”
Iterative computation of , with propagation in each iteration
i is the mapping after the i’th iteration
0 is the initial mapping
Each iteration computes i based on i-1 and the propagation graph
Stop when a stable mapping is reached
Similarity Flooding Calculation
Similarity Flooding Calculation
Many ways to iterate:
Similarity Flooding Calculation
Similarity Flooding Calculation
B: initial mapping has high importance, recurring in propagation
C: initial mapping and current mapping have identical importance
Complexity
Usually 5-30 iterations
Each iteration is O(|E|) (edges in propagation graph)
|E| = O(|E1|•|E2|)
|E1| = O(|V1|2) – if G1 is highly connected
|E2| = O(|V2|2) – if G2 is highly connected
Worst case of each iteration is O(|V1|2•|V2|2)
Average case of each iteration is O(|V1|•|V2|)
Limitations
Algorithm requires representation as directed, labeled graph
Degrades when edges are unlabeled or undirected
Degrades when labeling is more uniform
Assumes structural adjacency contributes to similarity
Will not work for matching HTML
Requires matched objects to be of same type and with same graph representation
Limitations
Algorithm cannot utilize order and aggregation information (e.g. for XML)
Order: the order of sub-elements within an element
Aggregation: an element containing an “array” of sub-elements


