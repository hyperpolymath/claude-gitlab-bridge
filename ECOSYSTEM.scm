;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — claude-gitlab-bridge

(ecosystem
  (version "1.0.0")
  (name "claude-gitlab-bridge")
  (type "project")
  (purpose "Bidirectional interface enabling Claude AI to interact with GitLab APIs")

  (position-in-ecosystem
    "Part of hyperpolymath ecosystem. Follows RSR guidelines. Core integration layer for AI-assisted GitLab workflows.")

  ;;; Internal Integrations
  (integrations-internal
    (all-projects
      (purpose . "Deployment and management")
      (protocol . "gitlab-api")))

  ;;; External Integrations
  (integrations-external
    (gitlab
      (purpose . "Primary API endpoint")
      (protocol . "rest-api-v4")
      (auth . "personal-access-token")
      (base-url . "https://gitlab.com/api/v4")
      (operations . (projects repositories issues merge-requests pipelines releases wikis)))
    (claude
      (purpose . "Command generation target")
      (protocol . "json-commands")
      (direction . "bidirectional")
      (capabilities . (command-generation response-parsing context-management))))

  ;;; API Interfaces
  (apis
    (cli
      (interface . "deno-cli")
      (modes . (interactive execute batch)))
    (internal
      (endpoint . "http://localhost:8888")
      (protocol . "http")
      (optional . #t)))

  ;;; Related Projects
  (related-projects
    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard"))
    (project
      (name "anthropic-sdk")
      (url "https://github.com/anthropics/anthropic-sdk-typescript")
      (relationship "dependency")))

  ;;; Bridge Capabilities
  (capabilities
    (command-generation
      (description . "Generate GitLab API commands from natural language")
      (dry-run . #t))
    (batch-execution
      (description . "Execute multiple GitLab operations in sequence")
      (json-input . #t))
    (comprehensive-logging
      (description . "Full audit trail of all operations")
      (log-file . "~/.claude-gitlab-bridge/bridge.log"))
    (error-handling
      (description . "Automatic retries with exponential backoff")
      (max-retries . 3)))

  ;;; What This Is / Is Not
  (what-this-is
    "Bidirectional bridge for Claude-GitLab interaction enabling:
     - GitLab API operations (CRUD on projects, repos, issues, MRs)
     - CI/CD pipeline control
     - Command generation for Claude
     - Batch operation execution
     - Dry-run mode for safety")

  (what-this-is-not
    "- NOT direct Claude API integration (generates commands only)
     - NOT for self-hosted GitLab without modification
     - NOT for git operations beyond GitLab API
     - NOT for repository content analysis
     - NOT for automated code review
     - NOT for GitLab administration tasks
     - NOT exempt from RSR compliance"))
