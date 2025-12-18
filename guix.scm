;; SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2024-2025 hyperpolymath
;;
;; claude-gitlab-bridge - Guix Package Definition
;; Run: guix shell -D -f guix.scm

(use-modules (guix packages)
             (guix gexp)
             (guix git-download)
             (guix build-system gnu)
             ((guix licenses) #:prefix license:)
             (gnu packages base))

(define-public claude-gitlab-bridge
  (package
    (name "claude-gitlab-bridge")
    (version "0.1.0")
    (source (local-file "." "claude-gitlab-bridge-checkout"
                        #:recursive? #t
                        #:select? (git-predicate ".")))
    (build-system gnu-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (delete 'check)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (share (string-append out "/share/claude-gitlab-bridge")))
               (mkdir-p share)
               (copy-recursively "." share)
               #t))))))
    (synopsis "Bridge between Claude AI and GitLab for developer productivity")
    (description "Claude GitLab Bridge enables integration between
Anthropic's Claude AI and GitLab for automated code review, issue analysis,
and enhanced developer productivity. Part of the RSR ecosystem.")
    (home-page "https://github.com/hyperpolymath/claude-gitlab-bridge")
    (license (list license:expat license:agpl3+))))

;; Return package for guix shell
claude-gitlab-bridge
