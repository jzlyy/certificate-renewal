# certificate-renewal(Kubernetes Environment)
[![GitHub License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

## Control plane certificate renewal
This project provides an automated periodic certificate renewal script for control plane certificates in Kubernetes environments.

## Application-layer certificate renewal (with auto-issuance of Ingress certificates).
It utilizes the cert-manager controller at the application layer to automatically issue certificates through the DNS01 challenge mechanism defined by the Cloudflare cloud provider. These certificates are bound to Ingress resources for TLS termination.  
MetalLB resources are employed to automatically assign external IP addresses to ingress-nginx. The ultimate implementation enables users to securely access backend Pod services through web browsers, ensuring a robust high-security mechanism throughout the process.

## Prometheus monitors cluster certificates
Based on Prometheus + Grafana, implement observable monitoring of certificate validity periods for the control plane and application layer within the cluster, seamlessly integrated with Alertmanager + DingTalk to enable rapid alerting responses to DingTalk group chats.

## Route planning
**Hierarchical Planning**
- Deployment---Service(ClusterIP)
- Cert-manager---ClusterIssuer/Issuer
- Metallb---IPAddressPool---L2Advertisement/BGPAdvertisement
- Ingress-Nginx---Certificate CRD---Ingress CRD

**Outcome Realization**
- WebServer---Ingress-Nginx--Ingress CRD---Service(ClusterIP)---Pod


## Security Policy
To report security vulnerabilities, please see [SECURITY.md](SECURITY.md)
