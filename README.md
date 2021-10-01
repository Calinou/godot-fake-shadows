# Rendering cheap shadows with Godot 3.4 beta

This **work-in-progress** demo project showcases various cheap shadow methods that
work with both the GLES3 and GLES2 renderers:

- Blob shadows.
- Fake stencil shadows using scaled MeshInstance.
- Fake shadow maps using a ViewportTexture applied on a plane.

**Note:** This project only works out of the box in Godot 3.4 beta
(due to physical key inputs being used). Nonetheless, its effects can be made to work
in Godot 3.3 as well.

## License

Unless otherwise specified, files in this repository are licensed under the
MIT license. See [LICENSE.md](LICENSE.md) for more information.
