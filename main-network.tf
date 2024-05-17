provider "google" {
  credentials = file("C:/Users/beatriz.leite.santos/Documents/Geneva-teste/credenciais/starry-strand-395614-0008357ef180.json")
  project     = "<starry-strand-395614>"
  region      = "us-central1"
}


## FOLDERS ##


## SHARED - Level 1 Folder ##
resource "google_folder" "fldr-shared_folder" {
  display_name = "fldr-shared"
  parent       = "organizations/510613106678"
}


## Under SHARED - Level 2 Folders  ##
resource "google_folder" "fldr_network" {
  display_name = "fldr-network"
  parent       = google_folder.fldr-shared_folder.name
}


## PROJECTS ##

# Network projects #
resource "google_project" "project_3" {
  name            = "eva-prj-hub-vpc"
  project_id      = "id-eva-prj-hub-vpc"
  billing_account = "019A3B-184BE4-980D3A"
  folder_id       = google_folder.fldr_network.name
}

resource "google_project" "project_4" {
  name            = "eva-prj-dev-spk"
  project_id      = "id-eva-prj-dev-spk"
  billing_account = "019A3B-184BE4-980D3A"
  folder_id       = google_folder.fldr_network.name
}

resource "google_project" "project_5" {
  name            = "eva-prj-hml-spk"
  project_id      = "id-eva-prj-hml-spk"
  billing_account = "019A3B-184BE4-980D3A"
  folder_id       = google_folder.fldr_network.name
}

resource "google_project" "project_6" {
  name            = "eva-prj-prd-spk"
  project_id      = "id-eva-prj-prd-spk"
  billing_account = "019A3B-184BE4-980D3A"
  folder_id       = google_folder.fldr_network.name
}