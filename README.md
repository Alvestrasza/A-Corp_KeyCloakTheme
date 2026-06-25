# A-Corp Keycloak Login Theme

**Version:** v0.1.0  
**Created:** 2026-06-25  
**Last Modified:** 2026-06-25  
**Author:** Nouramon Alvestrasza  
**Organization:** Alvestrasza Corporation

## Purpose

This repository contains a slim Keycloak login theme for the Alvestrasza Corporation corporate design. The theme intentionally avoids showing the realm name on the login screen and keeps the layout quiet, centered and lightweight, inspired by modern enterprise login pages.

## Design Tokens

| Token | Value | Purpose |
|---|---:|---|
| Deep Space | `#071018` | main dark surface |
| Void | `#04090e` | page background |
| Panel Blue | `#0b1721` | card and panel base |
| Text White | `#f1f4f5` | main text |
| Silver | `#c5cdd0` | secondary text and borders |
| Crimson | `#d4483e` | corporate accent |
| Muted | `#8b9aa1` | helper text |

## Repository Structure

```text
acorp-keycloak-theme/
├── docker-compose.yml
├── README.md
├── CHANGELOG.md
├── docs/
│   └── design-notes.md
├── preview/
│   └── login-preview.html
├── scripts/
│   ├── package-theme.sh
│   └── sync-logo-from-website.sh
└── themes/
    └── acorp-login/
        └── login/
            ├── theme.properties
            ├── messages/
            │   ├── messages_de.properties
            │   └── messages_en.properties
            └── resources/
                ├── css/
                │   └── acorp-login.css
                └── img/
                    ├── alvestrasza-emblem.svg
                    └── README.md
```

## Logo Handling

The production website currently references the emblem as:

```text
/public/assets/alvestrasza-emblem-transparent.png
```

This package includes a lightweight SVG fallback named `alvestrasza-emblem.svg`. For the exact website logo, copy the PNG from the website repository into:

```text
themes/acorp-login/login/resources/img/alvestrasza-emblem-transparent.png
```

Then change this line in `themes/acorp-login/login/resources/css/acorp-login.css`:

```css
--acorp-emblem: url("../img/alvestrasza-emblem.svg");
```

to:

```css
--acorp-emblem: url("../img/alvestrasza-emblem-transparent.png");
```

You can also run:

```bash
./scripts/sync-logo-from-website.sh ../A-Corp_Website
```

## Local Test with Docker Compose

```bash
docker compose up -d
```

Open Keycloak on `http://localhost:8080`, log in as `admin` / `admin`, create or select a realm, then choose:

```text
Realm settings → Themes → Login theme → acorp-login
```

For production, pin the Keycloak container image version instead of using `latest`.

## Deployment on a Keycloak Server

Copy the theme folder to your Keycloak themes directory:

```bash
sudo cp -r themes/acorp-login /opt/keycloak/themes/acorp-login
sudo /opt/keycloak/bin/kc.sh build
sudo systemctl restart keycloak
```

Then select the theme in the realm settings.

## Notes

- The realm name is removed through localized message overrides and defensive CSS hiding of the default realm header.
- The theme uses `parent=keycloak.v2`. For older Keycloak installations, change the parent to `keycloak` and test the CSS selectors.
- No custom login flow templates are overridden in v0.1.0. This keeps the theme compatible with standard Keycloak flows such as reset password, OTP and required actions.
