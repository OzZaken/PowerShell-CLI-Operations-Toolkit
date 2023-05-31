## nslookup 
DNS name resolution query tool
| Description                                                                       | commands                                    |
| --------------------------------------------------------------------------------- | ------------------------------------------- |
| Queries a DNS server for a specific type of record (e.g. A, MX, NS)               | `nslookup -type=[record type] [hostname]`   |
| Queries a DNS server for a specific class of record (e.g. IN for Internet)        | `nslookup -class=[record class] [hostname]` |
| Enables debugging for the nslookup session                                        | `nslookup -debug [hostname]`                |
| Suppresses the display of the initial nslookup banner                             | `nslookup -sil[ent]`                        |
| Allows nslookup to send multiple queries to the DNS server to improve performance | `nslookup -vc`                              |
| Sets the number of retries for the nslookup session                               | `nslookup -retry=[number]`                  |
| Sets the timeout for the nslookup session                                         | `nslookup -timeout=[seconds]`               |
| Queries a DNS server for information about a specific hostname                    | `nslookup [hostname]`                       |
| Queries a specific DNS server for information about a specific hostname           | `nslookup [hostname] [DNS server]`          |