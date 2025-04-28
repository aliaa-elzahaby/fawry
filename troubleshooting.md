# Fawry Internship Task - Troubleshooting Report

## Task 1: Custom grep command (`mygrep.sh`)
[See attached screenshots for test results]

## Task 2: DNS/Network Troubleshooting

### Tests Performed
1. DNS Resolution:
   ```powershell
   nslookup internal.example.com
   nslookup internal.example.com 8.8.8.8

Explanation:
"Although I couldn't actually connect to the internal service from my personal device, the troubleshooting steps demonstrated:

Proper DNS verification methodology

Systematic network connectivity checks

Correct use of diagnostic tools"

Reflection:
"In a real corporate environment, I would:

First connect to the company VPN

Verify internal DNS resolution

Check with network teams about any firewall rules"

.........................................................

What I Tested
Custom mygrep.sh Script:

Basic string matching (case-insensitive)

-n option for line numbers

-v option for inverted matches

Combined flags (-vn, -nv)

Error handling (missing arguments, invalid files)

DNS/Network Troubleshooting:

DNS resolution via internal and public DNS

TCP connectivity to port 80

ICMP ping tests

Route table verification

Expected vs Actual Results
Test Case	Expected Result	Actual Result
./mygrep.sh hello testfile.txt	Print matching lines	✅ Success: Output matched expected
./mygrep.sh -n hello testfile.txt	Show line numbers	✅ Success: Correct line numbers
./mygrep.sh -v hello testfile.txt	Inverted match	✅ Success: Non-matching lines shown
nslookup internal.example.com	Internal DNS resolution	❌ Failed (expected - no corp DNS)
ping 10.0.0.15	Successful ICMP reply	❌ Timeout (expected - no VPN)
Test-NetConnection 10.0.0.15 -Port 80	TCP connection	❌ Failed (expected - no route)
Lessons Learned
Script Development:

Option parsing in Bash requires careful handling of positional parameters

Case-insensitive matching needs special syntax (${var,,})

Error handling makes scripts more robust

Network Troubleshooting:

Internal domains won't resolve via public DNS

Network segmentation affects connectivity

Proper documentation is crucial for reproducibility

Professional Practices:

Version control helps track changes

Clear documentation saves time for reviewers

Simulated environments still demonstrate skills