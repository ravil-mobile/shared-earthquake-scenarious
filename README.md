# Shared Earthquake Scenarious

loh1 - layer over halfspace with a single point source


## Get started

- Clone the repository
- Copy a scenario (e.g., `loh1`) to the folder with SeisSol's executable.
- Open `parameters.par`, edit `MeshFile` - i.e., specify the exact mesh location (absolute or relative path)
- Meshes are stored in `meshes` directory

## Git LFS

`git-lfs` is required to download mesh files. Please follow [the instruction](http://arfc.github.io/manual/guides/git-lfs) - i.e., steps 1-3 - and install `git-lfs` addon. Note, the installation script accepts `PREFIX` env. variable, which you can use to install the addon to a specific directory. In this case, You will need to append your `PATH` env. variable with the location of `git-lfs` executable - i.e., the installation directory.

Execute the following once you clone the repository to download meshes

```
git lfs pull
```
