# Own-Website

Personal static website and CV for Ricardo Andaluz.

## Repository structure
- `public/` — static site files (HTML, CSS, JS). Main site files live here.
- `terraform/` — Terraform configuration used to provision hosting resources.

## Quick start / Local preview
1. Serve the `public/` folder locally to preview the site. From the repo root:

```bash
python3 -m http.server 8000 --directory public
# then open http://localhost:8000 in your browser
```

Or use your editor's Live Server extension to serve the `public/` folder.

## Editing the CV
- The CV is at `public/ricardo-andaluz-cv.html`. Edit that file directly to update content.

## Deploy
Primary deployment is managed with Terraform in the `terraform/` folder. Typical workflow:

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

This repository has been used with Azure Static Web Apps; adjust provider/config values in `terraform/` as needed.

## Notes
- Keep content changes inside `public/` (HTML/CSS/JS).
- Commit changes on the `main` branch and run your CI/CD or Terraform workflow to deploy.

## Contact
For questions or edits, update `public/ricardo-andaluz-cv.html` or open an issue.
