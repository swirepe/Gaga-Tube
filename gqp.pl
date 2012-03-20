# gaga quote parser

open( IN, "gagaquotes.txt");
open(OUT, ">gagaparsed.txt");

@lines = <IN>;

@quotes = ();
foreach $line (@lines){
    unless($line =~ m/^\—/){
        chomp($line);
        $line =~ s/"/\\"/g;
        push(@quotes, $line);
    }
}

foreach $quote (@quotes){
    next if $quote =~ m/^\s*$/;
    print OUT "\"$quote\",\n";
}

close(IN);
close(OUT);
