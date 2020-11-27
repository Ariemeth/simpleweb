build multi-arch with docker using 

```bash
DOCKER_BUILDKIT=1 \
  docker buildx build \
    --push \
    --platform linux/arm64/v8,linux/amd64 \
    -f Dockerfile \
    --target "release" \
    -t edwardcarmack/simpleweb:0.0.1 \
    .
```
