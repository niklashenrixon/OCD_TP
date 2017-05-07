#define TRUE 1
#define FALSE 0

class CfgMods {

    class OCD_TP {
        dir = "@OCD_TP";
        picture = "\ocd_core\logo.paa";
        name = "OCD Transport Protocol";
        author = "Nixon";
        hidePicture = 0;
        hideName = 0;
        version = "1.0";
    };
    author = "Nixon";
};

class CfgPatches
{
    class OCD_TP
    {
        name      = "OCD Transport Protocol";
        author    = "Nixon";
        authorUrl = "http://github.com/niklashenrixon/OCD_TP";

        version         = "1.0";
        requiredVersion = 1.0;
        requiredAddons[] = {};
    };
};