# A-Corp Keycloak Theme - Design Notes

**Version:** v0.1.0  
**Created:** 2026-06-25  
**Last Modified:** 2026-06-25  
**Author:** Nouramon Alvestrasza  
**Organization:** Alvestrasza Corporation

## Intent

The login page should feel like an A-Corp system gateway, not like a generic application login. It should be restrained, quiet and trustworthy.

## Visual Direction

- Dark cinematic background using Deep Space and Void.
- Single centered card with subtle transparency and silver border.
- Crimson only as controlled accent, not as a dominant warning color.
- Logo/emblem centered above the card.
- No visible realm name.
- No large marketing panel or secondary content column.

## Compatibility Choice

The theme currently does not override Keycloak FreeMarker login templates. It inherits from `keycloak.v2` and changes appearance through CSS and message overrides. This keeps standard Keycloak pages and flows more stable across updates.

## Production Hardening Notes

- Pin the Keycloak version in `docker-compose.yml` for testing.
- Test username/password, password reset, OTP, WebAuthn and required actions before production rollout.
- Keep theme caching enabled in production after testing.
- Use the exact production logo from the website repository.
