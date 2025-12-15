;;; STATE.scm — claude-gitlab-bridge
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (claude-gitlab-bridge state)
  #:export (metadata
            connection-config
            settings
            logging-config
            rate-limiting
            current-position
            blockers-and-issues
            critical-next-actions
            session-history
            state-summary))

;;; Metadata
(define metadata
  '((version . "1.0.0")
    (updated . "2025-12-15")
    (project . "claude-gitlab-bridge")))

;;; Connection Configuration
(define connection-config
  '((gitlab-url . "https://gitlab.com")
    (api-version . "v4")
    (username . "hyperpolymath")
    (token-env . "GITLAB_TOKEN")))

;;; Application Settings
(define settings
  '((dry-run . #f)
    (max-retries . 3)
    (timeout . 30)
    (cache-enabled . #t)
    (cache-dir . "~/.claude-gitlab-bridge/cache")))

;;; Logging Configuration
(define logging-config
  '((enabled . #t)
    (level . "INFO")
    (file . "~/.claude-gitlab-bridge/bridge.log")
    (rotate . #t)
    (max-size . "10MB")))

;;; Rate Limiting
(define rate-limiting
  '((respect-headers . #t)
    (max-requests-per-minute . 60)
    (backoff-strategy . "exponential")))

;;; Current Position
(define current-position
  '((phase . "v1.0 - Handover Documentation")
    (overall-completion . 30)
    (components
     ((rsr-compliance
       ((status . "complete")
        (completion . 100)))
      (documentation
       ((status . "in-progress")
        (completion . 80)))
      (core-implementation
       ((status . "pending")
        (completion . 0)))
      (testing
       ((status . "pending")
        (completion . 0)))))))

;;; Blockers and Issues
(define blockers-and-issues
  '((critical ())
    (high-priority
     (("Implement core bridge functionality" . "requires architecture finalization")))))

;;; Critical Next Actions
(define critical-next-actions
  '((immediate
     (("Complete handover documentation" . high)
      ("Define TypeScript/ReScript interfaces" . high)))
    (this-week
     (("Implement GitLab API client" . medium)
      ("Set up test infrastructure" . medium)))
    (this-month
     (("Implement command generation" . low)
      ("Add batch execution support" . low)))))

;;; Session History
(define session-history
  '((snapshots
     ((date . "2025-12-15")
      (session . "initial")
      (notes . "SCM files added"))
     ((date . "2025-12-15")
      (session . "handover")
      (notes . "Added handover documentation to SCM files")))))

;;; State Summary
(define state-summary
  '((project . "claude-gitlab-bridge")
    (completion . 30)
    (blockers . 1)
    (updated . "2025-12-15")
    (next-milestone . "Core Implementation")))
