# github-actions_runner-docker_image

This image is an extended build of the image `summerwind/actions-runner`, this extra software has been packaged:
- kubectl
- aws-cli
- nodejs
- pnpm
- docker

Test the image on [act](https://github.com/nektos/act)

```bash
$ act                                                                                                                      
Stage  Job ID          Job name                                                      Workflow name      Workflow file          Events                          
0      build           Build app image and push to ECR registry                      Build App          build-app.yaml         push,workflow_dispatch    
```

```bash
$ docker buildx build . --tag act-local-runner
$ docker run -it act-local-runner /bin/sh
$ act --job deploy --action-offline-mode --platform self-hosted=act-local-runner --var AWS_REGION=eu-central-1 --var AWS_ACCOUNT_ID=x --var ENVIRONMENT=development --secret AWS_ACCESS_KEY_ID=y --secret AWS_SECRET_ACCESS_KEY=z
```