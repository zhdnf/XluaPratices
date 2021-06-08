using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

/*
*/

/// <summary>
///
/// </summary>

public class LuaCopyEditor : MonoBehaviour
{   
    [MenuItem("XLua/lua2txt")]
    public static void CopyLuaToTxT()
    {
        // find lua file
        string path = Application.dataPath + "/Lua/";
        if(!Directory.Exists(path)) return;
        // get lua file path
        string[] strs = Directory.GetFiles(path, "*.lua");
        for(int i=0; i< strs.Length; i++)
        {
            Debug.Log(strs[i]);
        }
        // copy lua to other file
        string newPath = Application.dataPath + "/LuaTxT/";
        if(!Directory.Exists(newPath)) 
        {
            Directory.CreateDirectory(newPath);
        }
        else
        {
            string[] oldFileStrs = Directory.GetFiles(newPath, "*.txt");
            for(int i=0; i<oldFileStrs.Length; i++)
            {
                File.Delete(oldFileStrs[i]);
            }

        }

        List<string> newFilePath = new List<string>();
        string fileName;
        for(int i=0; i<strs.Length; ++i)
        {
            fileName = newPath + strs[i].Substring(strs[i].LastIndexOf("/") + 1) + ".txt";
            newFilePath.Add(fileName);
            File.Copy(strs[i], fileName);
        }
        AssetDatabase.Refresh();

        for(int i=0; i<newFilePath.Count; i++)
        {
            AssetImporter importer = AssetImporter.GetAtPath(newFilePath[i].Substring(newFilePath[i].IndexOf("Assets")));
            if(importer != null)
            {
                importer.assetBundleName = "lua";
            }
        }




    }
}
