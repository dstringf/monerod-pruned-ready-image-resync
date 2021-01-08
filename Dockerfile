FROM gcr.io/high-science-238600/monerod-pruned-ready-image:latest
RUN apt-get update && apt-get upgrade -y
RUN /home/monero/monerod --log-file /home/monero/.bitmonero/bitmonero.log --detach --prune-blockchain --sync-pruned-blocks --db-sync-mode safe --enforce-dns-checkpointing && (tail -f -n0 /home/monero/.bitmonero/bitmonero.log & ) | grep -q "SYNCHRONIZED OK"
