use Graph;
use Graph::Similarity;

my $g1 = Graph->new(multiedged => 1);
$g1->add_vertices("a","a1","a2");
$g1->add_edge_by_id("a", "a1", "l1");
$g1->add_edge_by_id("a", "a2", "l2");
$g1->add_edge_by_id("a1", "a2", "l2");

my $g2 = Graph->new(multiedged => 1);
$g2->add_vertices("b","b1");
$g2->add_edge_by_id("b", "b1", "l4");

my $s = new Graph::Similarity(graph => [$g1,$g2]);
my $method = $s->use('SimilarityFlooding');
$method->setNumOfIteration(5);
my $result = $method->calculate();
# print Dumper $result
$method->showAllSimilarities();