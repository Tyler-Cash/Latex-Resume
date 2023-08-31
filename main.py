import os
import subprocess
from github import Github


DOCUMENT_NAME = 'resume'
github_token = os.getenv('GITHUB_TOKEN')
if github_token is None:
    raise ValueError('GITHUB_TOKEN environment variable can\'t be None')

github = Github(github_token)


def generate_pdf():
    subprocess.check_call(['pdflatex', '{}.tex'.format(DOCUMENT_NAME)])


def release_pdf():
    cwd = os.path.abspath(os.getcwd())
    resume_pdf_path = os.path.join(cwd, 'Tyler Cash - Resume.pdf')
    repo = github.get_user().get_repo('Latex-Resume')
    latest_release = repo.get_latest_release()

    tag = latest_release.tag_name
    # Iterates subversion number by 1, e.g v1.0 will become v1.1
    tag = tag[:len(tag) - 1] + str(int(tag[len(tag) - 1]) + 1)
    new_release = repo.create_git_release(tag, 'Tyler Cash\'s resume', '')
    new_release.upload_asset(resume_pdf_path, content_type='application/pdf')


generate_pdf()
release_pdf()
