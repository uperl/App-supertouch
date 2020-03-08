package App::supertouch;

use strict;
use warnings;
use 5.008001;
use Path::Tiny qw( path );

# ABSTRACT: Touch with directories
# VERSION

=head1 SYNOPSIS

 % supertouch foo/bar/baz.txt

=head1 DESCRIPTION

C<supertouch> is a command similar to C<touch>, except it creates the directories structure
necessary if it doesn't already exist.  This module contains the main machinery for the
C<supertouch> program.  For details on how to use the program, see L<supertouch>.

=head1 SEE ALSO

=over 4

=item L<supertouch>

=back

=cut

sub main
{
  my(undef, @args) = @_;

  my $verbose = 0;
  my $options = 1;

  foreach my $arg (@args)
  {
    if($options && $arg =~ /^-/)
    {
      if($arg eq '--')
      {
        $options = 0;
      }
      elsif($arg eq '-v')
      {
        $verbose = 1;
      }
      next;
    }
    if($arg eq '')
    {
      print STDERR "'' (empty) is not a legal filename";
      return 2;
    }
    if($arg =~ s{[\\/]$}{})
    {
      my $dir = path($arg);
      if($dir->is_file)
      {
        print STDERR "$dir is a file";
        return 2;
      }
      unless(-d $dir)
      {
        print "DIR  @{[ $dir ]}\n" if $verbose;
        $dir->mkpath;
      }
    }
    else
    {
      my $file = path($arg);
      if($file->is_dir)
      {
        print STDERR "$file is a directory";
        return 2;
      }
      unless(-d $file->parent)
      {
        print "DIR  @{[ $file->parent ]}\n" if $verbose;
        $file->parent->mkpath;
      }
      unless(-f $file)
      {
        print "FILE @{[ $file ]}\n" if $verbose;
        $file->touch;
      }
    }
  }

  return 0;
}

1;
