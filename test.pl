# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 1 };
use Crypt::SmbHash;
ok(1); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.

# Test Empty Password
my ( $lm, $nt );

ntlmgen "",$lm,$nt;
ok($lm,"AAD3B435B51404EEAAD3B435B51404EE");
ok($nt,"31D6CFE0D16AE931B73C59D7E0C089C0");

# Test simple password
ntlmgen "abcdef",$lm,$nt;
ok($lm,"13D855FC4841C7B1AAD3B435B51404EE");
ok($nt,"B5FE2DB507CC5AC540493D48FBD5FE33");

# Test long password
ntlmgen "abcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxyzzzzzzzzz",$lm,$nt;
ok($lm,"E0C510199CC66ABD8C51EC214BEBDEA1");
ok($nt,"D71B61697C939BE27C14A7D7E23948EE");
