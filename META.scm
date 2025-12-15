;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — claude-gitlab-bridge

(define-module (claude-gitlab-bridge meta)
  #:export (project-metadata
            boundaries
            architecture-decisions
            development-practices
            design-rationale
            dependencies
            interfaces
            commands
            security
            testing
            deployment))

;;; Project Metadata
(define project-metadata
  '((name . "claude-gitlab-bridge")
    (version . "1.0.0")
    (description . "Bidirectional bridge for Claude-GitLab interaction")
    (author . "Jonathan D.A. Jewell")
    (license . "MIT")
    (repository
     (url . "https://gitlab.com/hyperpolymath/claude-gitlab-bridge.git")
     (branch . "main"))))

;;; Project Boundaries
(define boundaries
  '((includes
     . (gitlab-api-operations
        command-generation
        batch-execution
        project-deployment
        repository-sync
        ci-cd-control
        issue-management
        merge-request-handling
        wiki-page-management
        release-tag-creation))
    (excludes
     . (claude-api-direct          ; No direct Claude API integration
        self-hosted-gitlab         ; Without modification
        git-internals              ; Beyond GitLab API
        code-analysis              ; Repository content analysis
        code-review-automation     ; Automated code review
        gitlab-admin))))           ; GitLab administration tasks

;;; Architecture Decisions
(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Bridge between Claude AI and GitLab for enhanced developer productivity")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "Multi-platform CI")))
    (adr-002
     (title . "Language Selection")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Need type-safe implementation for GitLab API interactions")
     (decision . "Use ReScript as primary, TypeScript for legacy compatibility per RSR policy")
     (consequences . ("Type safety" "Functional paradigm" "JavaScript interop")))))

;;; Development Practices
(define development-practices
  '((code-style
     (languages . ("ReScript" "TypeScript" "Scheme"))
     (formatter . "auto-detect")
     (linter . "auto-detect"))
    (security
     (sast . "CodeQL")
     (credentials . "env-vars-only")
     (audit-log . #t))
    (testing
     (coverage-minimum . 70)
     (unit . "vitest")
     (integration . "vitest")
     (mock-mode . #t))
    (versioning
     (scheme . "SemVer 2.0.0"))))

;;; Design Rationale
(define design-rationale
  '((why-rsr . "RSR ensures consistency, security, and maintainability.")
    (why-rescript . "Type safety with functional paradigm, compiles to clean JS.")
    (why-bidirectional . "Claude generates commands, bridge executes and returns results.")))

;;; Dependencies
(define dependencies
  '((runtime
     (node . "18+")
     (deno . "1.40+"))
    (packages
     (anthropic-sdk . "latest")
     (gitlab-api . "latest"))
    (optional
     (redis . "caching"))))

;;; Interfaces
(define interfaces
  '((cli
     (command . "claude-gitlab-bridge")
     (modes . (interactive execute batch deploy sync generate)))
    (api
     (internal-only . #t)
     (port . 8888)
     (protocol . "http"))))

;;; Supported Commands
(define commands
  '((project . (create update delete list get))
    (repository . (clone push create-branch merge-request))
    (files . (create update delete get upload-directory))
    (ci-cd . (create-pipeline trigger-pipeline get-status cancel-pipeline))
    (issues . (create update list close reopen add-comment boards))
    (merge-requests . (create update merge approve list))
    (releases . (create tag list delete))
    (wiki . (create update delete list))))

;;; Security Configuration
(define security
  '((auth . "personal-access-token")
    (tls . #t)
    (audit-log . #t)
    (token-scopes . (api read_repository write_repository))
    (webhook-validation . #t)))

;;; Testing Configuration
(define testing
  '((unit . "vitest tests/unit/")
    (integration . "vitest tests/integration/")
    (e2e . "vitest tests/e2e/")
    (mock-mode . #t)
    (coverage-target . 80)))

;;; Deployment Options
(define deployment
  '((standalone . "deno run --allow-net --allow-env src/main.ts")
    (docker . "docker run claude-gitlab-bridge")
    (systemd-service . #t)))
