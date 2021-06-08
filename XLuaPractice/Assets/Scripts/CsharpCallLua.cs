using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using XLua;
using System;

/*
*/

/// <summary>
///
/// </summary>

public static class CsharpCallLua
{
    [CSharpCallLua]
    public static List<Type> csharpCallLuaList = new List<Type>(){
        typeof(UnityAction<bool>),
    };

}
