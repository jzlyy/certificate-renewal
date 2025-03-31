# certificate-renewal(Kubernetes Environment)
[![GitHub License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

Control plane and application-layer certificate renewal (with auto-issuance of Ingress certificates at the application layer)

>This project provides an automated periodic certificate renewal script for control plane certificates in Kubernetes environments. It utilizes the cert-manager controller at the application layer to automatically issue certificates through the DNS01 challenge mechanism defined by the Cloudflare cloud provider. These certificates are bound to Ingress resources for TLS termination. Additionally, MetalLB resources are employed to automatically assign external IP addresses to ingress-nginx. The ultimate implementation enables users to securely access backend Pod services through web browsers, ensuring a robust high-security mechanism throughout the process.

## Security Policy
To report security vulnerabilities, please see [SECURITY.md](SECURITY.md)
