resource "vercel_project" "lab_deployment" {
  name      = "lab6-terraform"
  framework = "vite"
  git_repository = {
    type = "github"
    repo = "Nastiia18/lab-1-setup"
  }
}

resource "vercel_project_domain" "custom_domain" {
  project_id = vercel_project.lab_deployment.id
  domain     = "lab6-${var.student_id}.vercel.app"
}
