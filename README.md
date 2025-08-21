# Temporal Auto-Setup with Healthcheck

This repository builds a Docker image based on `temporalio/auto-setup` with an added healthcheck.

## Usage

```bash
docker pull songsterr/temporalio-auto-setup-healthcheck:latest
# or specific version
docker pull songsterr/temporalio-auto-setup-healthcheck:1.27.3
```

## Updating Version

To update to a new Temporal version:

1. Edit the `Dockerfile` and change the version in the `FROM` line
2. Commit and push to main branch
3. GitHub Actions will automatically build and publish the new image

## Current Version

- Temporal: 1.27.3
- Image: `songsterr/temporalio-auto-setup-healthcheck:1.27.3`

## Healthcheck

The image includes a healthcheck that runs:
```bash
temporal operator namespace describe default
```

This ensures Temporal is not just running, but actually functional.

## Repository Setup

### Required Secrets

In the repository settings, add these secrets:

1. `DOCKERHUB_USERNAME`: Your Docker Hub username
2. `DOCKERHUB_TOKEN`: Docker Hub access token

### GitHub Actions

The workflow automatically:
- ✅ Builds multi-architecture images (AMD64 + ARM64)
- ✅ Extracts version from Dockerfile
- ✅ Tags with both version and `:latest`
- ✅ Uses build cache for faster builds
- ✅ Updates Docker Hub description

## Integration

Use in your projects:

```typescript
// Instead of building locally:
const temporalImage = new GenericContainer('songsterr/temporalio-auto-setup-healthcheck:latest')
```

Or in docker-compose:

```yaml
services:
  temporal:
    image: songsterr/temporalio-auto-setup-healthcheck:latest
    ports:
      - "7233:7233"
```