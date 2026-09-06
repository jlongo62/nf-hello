# hello

A simple Nextflow pipeline that prints _"Hello World!"_. 

# Run in Azure

```sh
cd /home/q/nf-hello

nextflow run main.nf \
  -c /home/q/nf-hello/az_pool_auto.config \
  -profile az_pool_auto \
  -params-file /home/q/secrets/nf-azure.json
```