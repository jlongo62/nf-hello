# hello

A simple Nextflow pipeline that prints _"Hello World!"_. 

# Run in Azure

```sh
cd /home/q/nf-hello

nextflow pull jlongo62/nf-hello 

nextflow run jlongo62/nf-hello \
  -profile az_pool_auto \
  -params-file /home/q/secrets/nf-azure-nfcc2.json
  
```

# Run in AWS

```sh
# Edit nf-aws-template.json with the AWS work bucket and output location.

. /home/q/secrets/aws-credentials.sh

nextflow run . \
  -profile aws_batch \
  -params-file secrets/ nf-aws-template.json
```

# Troubleshooting

See Cloudwatch Query Results:
```
SOURCE logGroups(namePrefix: [], class: "STANDARD") START=-1w END=0s |
fields @timestamp, @message
| sort @timestamp desc
| limit 10000
```