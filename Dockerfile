FROM temporalio/auto-setup:1.27.3

# Add healthcheck
HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD temporal operator namespace describe default || exit 1

# Expose the Temporal frontend port
EXPOSE 7233