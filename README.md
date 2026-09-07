# hello

A simple Nextflow pipeline that prints _"Hello World!"_. 

# Run in Azure

```sh
cd /home/q/nf-hello

nextflow pull jlongo62/nf-hello 

nextflow run jlongo62/nf-hello \
  -profile az_pool_auto \
  -params-file /home/q/secrets/nf-azure.json
  
```