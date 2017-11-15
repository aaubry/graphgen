use Graph::Easy;

# Script loading
my @script = ();
if ($#ARGV < 0) {
    foreach $line ( <STDIN> ) {
        push @script, $line;
    }
} else {
    my $line = "";
    for (my $i = 0; $i <= $#ARGV; $i = $i + 1) {
        if ($ARGV[$i] eq ".") {
            push @script, $line;
            $line = "";
        } else {
            if (length($line) > 0) {
                $line = $line . " ";
            }
            $line = $line . $ARGV[$i];
        }
    }
    push @script, $line;
}

# Parsing
my $graph = Graph::Easy->new();
foreach $line ( @script ) {
    if ($line =~ m/^\s*([\w\-]+)\s+([\w\-]+)\s*$/) {
        $graph->add_edge ($1, $2);
    } elsif ($line =~ m/^\s*([\w\-]+)\s*$/) {
        $graph->add_node ($1);
    } elsif ($line =~ m/^\s*(#.*)?$/) {
        # Ignore blank and commented lines
    } else {
        die "Invalid line '$line'";
    }
}

print $graph->as_ascii();
