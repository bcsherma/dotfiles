alias k="kubectl"
alias sw="gt checkout"
alias vi="nvim"
alias vim="nvim"
alias chdb="docker exec -it tilt-clickhouse-1 clickhouse-client"
alias mysqldb="docker exec -it tilt-weave-mysql-1 mysql default_db -p"

# Reset macOS pf rules so traffic to :80/:443 redirects to :9080/:9443.
alias fix-gov='(
     echo "
rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 9080
rdr pass inet proto tcp from any to any port 443 -> 127.0.0.1 port 9443
" | sudo pfctl -ef -
) && (
    printf "rdr pass inet proto tcp from any to any port = 80 -> 127.0.0.1 port 9080\nrdr pass inet proto tcp from any to any port = 443 -> 127.0.0.1 port 9443\n" | sudo pfctl -ef -
)'
