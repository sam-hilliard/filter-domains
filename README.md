# filter_domains

`filter_domains.sh` is a bash script designed to assist bug hunters and security researchers in staying within the defined scope by removing out-of-scope domains from gathered subdomains during reconnaissance. This script takes in a list of in-scope domains and a list of subdomains, then filters out any subdomains that do not match the in-scope domains.

## Purpose

The purpose of `filter_domains.sh` is to streamline the process of filtering subdomains obtained during reconnaissance activities to ensure that only in-scope domains are considered for further analysis. This helps bug hunters and security professionals focus their efforts on relevant targets and adhere to the scope of their assessments.

## Usage

### Running filter_domains.sh

To use `filter_domains.sh`, provide two files as arguments:
1. A file containing a list of in-scope domains.
2. A file containing a list of subdomains to be filtered.

```bash
./filter_domains.sh in_scope.txt subdomains.txt
```

### Example Usage

Suppose `in_scope.txt` contains the following in-scope domains:
```
example.com
anotherdomain.com
```

And `subdomains.txt` contains a list of subdomains obtained during reconnaissance:
```
sub1.example.com
sub2.anotherdomain.com
sub3.outofscope.com
sub4.example.com
```

Running `filter_domains.sh` with these files will produce the following output:
```
sub1.example.com
sub2.anotherdomain.com
sub4.example.com
```

### Notes

- The script will output subdomains that match any of the in-scope domains or their subdomains.
- Ensure that the input files are formatted correctly, with one domain per line.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.
