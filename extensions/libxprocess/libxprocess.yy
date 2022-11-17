{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "libxprocess",
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "0.0.1",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2021-06-09T05:32:23.3229009-05:00",
  "license": "",
  "description": "",
  "helpfile": "",
  "iosProps": false,
  "tvosProps": false,
  "androidProps": false,
  "installdir": "",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","filename":"libxprocess.dll","origname":"","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcessExecute","externalName":"ProcessExecute","kind":1,"help":"ProcessExecute(command)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcessExecuteAsync","externalName":"ProcessExecuteAsync","kind":1,"help":"ProcessExecuteAsync(command)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"CompletionStatusFromExecutedProcess","externalName":"CompletionStatusFromExecutedProcess","kind":1,"help":"CompletionStatusFromExecutedProcess(procIndex)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ExecutedProcessWriteToStandardInput","externalName":"ExecutedProcessWriteToStandardInput","kind":1,"help":"ExecutedProcessWriteToStandardInput(procId,input)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ExecutedProcessReadFromStandardOutput","externalName":"ExecutedProcessReadFromStandardOutput","kind":1,"help":"ExecutedProcessReadFromStandardOutput(procId)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcIdExists","externalName":"ProcIdExists","kind":1,"help":"ProcIdExists(procId)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcIdKill","externalName":"ProcIdKill","kind":1,"help":"ProcIdKill(procId)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcListCreate","externalName":"ProcListCreate","kind":1,"help":"ProcListCreate()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcessId","externalName":"ProcessId","kind":1,"help":"ProcessId(procList,i)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcessIdLength","externalName":"ProcessIdLength","kind":1,"help":"ProcessIdLength(procList)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FreeProcInfo","externalName":"FreeProcInfo","kind":1,"help":"FreeProcInfo(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FreeProcList","externalName":"FreeProcList","kind":1,"help":"FreeProcList(procList)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ExecutableImageFilePath","externalName":"ExecutableImageFilePath","kind":1,"help":"ExecutableImageFilePath(procInfo)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"CurrentWorkingDirectory","externalName":"CurrentWorkingDirectory","kind":1,"help":"CurrentWorkingDirectory(procInfo)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ParentProcessId","externalName":"ParentProcessId","kind":1,"help":"ParentProcessId(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ChildProcessId","externalName":"ChildProcessId","kind":1,"help":"ChildProcessId(procInfo,i)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ChildProcessIdLength","externalName":"ChildProcessIdLength","kind":1,"help":"ChildProcessIdLength(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"CommandLine","externalName":"CommandLine","kind":1,"help":"CommandLine(procInfo,i)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"CommandLineLength","externalName":"CommandLineLength","kind":1,"help":"CommandLineLength(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"Environment","externalName":"Environment","kind":1,"help":"Environment(procInfo,i)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"EnvironmentLength","externalName":"EnvironmentLength","kind":1,"help":"EnvironmentLength(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"OwnedWindowId","externalName":"OwnedWindowId","kind":1,"help":"OwnedWindowId(procInfo,i)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"OwnedWindowIdLength","externalName":"OwnedWindowIdLength","kind":1,"help":"OwnedWindowIdLength(procInfo)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"WindowIdExists","externalName":"WindowIdExists","kind":1,"help":"WindowIdExists(winId)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"WindowIdKill","externalName":"WindowIdKill","kind":1,"help":"WindowIdKill(winId)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcIdFromSelf","externalName":"ProcIdFromSelf","kind":1,"help":"ProcIdFromSelf()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ParentProcIdFromSelf","externalName":"ParentProcIdFromSelf","kind":1,"help":"ParentProcIdFromSelf()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ExecutableFromSelf","externalName":"ExecutableFromSelf","kind":1,"help":"ExectuableFromSelf()","hidden":false,"returnType":1,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"DirectoryGetCurrentWorking","externalName":"DirectoryGetCurrentWorking","kind":1,"help":"DirectoryGetCurrentWorking()","hidden":false,"returnType":1,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"DirectorySetCurrentWorking","externalName":"DirectorySetCurrentWorking","kind":1,"help":"DirectorySetCurrentWorking(dname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"EnvironmentGetVariable","externalName":"EnvironmentGetVariable","kind":1,"help":"EnvironmentGetVariable(name)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"EnvironmentSetVariable","externalName":"EnvironmentSetVariable","kind":1,"help":"EnvironmentSetVariable(name,value)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"EnvironmentUnsetVariable","externalName":"EnvironmentUnsetVariable","kind":1,"help":"EnvironmentUnsetVariable(name)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FreeExecutedProcessStandardInput","externalName":"FreeExecutedProcessStandardInput","kind":1,"help":"FreeExecutedProcessStandardInput(procIndex)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"FreeExecutedProcessStandardOutput","externalName":"FreeExecutedProcessStandardOutput","kind":1,"help":"FreeExecutedProcessStandardOutput(procIndex)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcInfoFromProcId","externalName":"ProcInfoFromProcId","kind":1,"help":"ProcInfoFromProcId(procId)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ExeFromProcId","externalName":"ExeFromProcId","kind":1,"help":"ExeFromProcId(procId)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"CwdFromProcId","externalName":"CwdFromProcId","kind":1,"help":"CwdFromProcId(procId)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"DirectoryGetTemporaryPath","externalName":"DirectoryGetTemporaryPath","kind":1,"help":"DirectoryGetTemporaryPath()","hidden":false,"returnType":1,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"WindowIdFromNativeWindow","externalName":"WindowIdFromNativeWindow","kind":1,"help":"WindowIdFromNativeWindow(window)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"EnvironmentGetVariableExists","externalName":"EnvironmentGetVariableExists","kind":1,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"ProcInfoFromProcIdEx","externalName":"ProcInfoFromProcIdEx","kind":1,"help":"ProcInfoFromProcIdEx(procId,kInfoFlags)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
          ],"documentation":"",},
      ],"constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"KINFO_EXEP","value":"0x1000","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"KINFO_CWDP","value":"0x2000","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"KINFO_PPID","value":"0x0100","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"KINFO_CPID","value":"0x0200","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"KINFO_ARGV","value":"0x0010","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"KINFO_ENVV","value":"0x0020","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"KINFO_OWID","value":"0x0001","hidden":false,},
      ],"ProxyFiles":[
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"libxprocess.dylib","TargetMask":1,},
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"libxprocess.so","TargetMask":7,},
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"libxprocess_x64.dll","TargetMask":6,},
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"libxprocess_arm.so","TargetMask":7,},
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"libxprocess_arm64.so","TargetMask":7,},
      ],"copyToTargets":194,"usesRunnerInterface":false,"order":[
        {"name":"ProcessExecute","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcessExecuteAsync","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CompletionStatusFromExecutedProcess","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExecutedProcessWriteToStandardInput","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExecutedProcessReadFromStandardOutput","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcIdExists","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcIdKill","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcListCreate","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcessId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcessIdLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"FreeProcInfo","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"FreeProcList","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExecutableImageFilePath","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CurrentWorkingDirectory","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ParentProcessId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ChildProcessId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ChildProcessIdLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CommandLine","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CommandLineLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"Environment","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"EnvironmentLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"OwnedWindowId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"OwnedWindowIdLength","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"WindowIdExists","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"WindowIdKill","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcIdFromSelf","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ParentProcIdFromSelf","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExecutableFromSelf","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"DirectoryGetCurrentWorking","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"DirectorySetCurrentWorking","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"EnvironmentGetVariable","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"EnvironmentGetVariableExists","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"EnvironmentSetVariable","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"EnvironmentUnsetVariable","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"DirectoryGetTemporaryPath","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"FreeExecutedProcessStandardInput","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"FreeExecutedProcessStandardOutput","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcInfoFromProcId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ProcInfoFromProcIdEx","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"ExeFromProcId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"CwdFromProcId","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"WindowIdFromNativeWindow","path":"extensions/libxprocess/libxprocess.yy",},
      ],},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","filename":"libxprocess.zip","origname":"","init":"","final":"","kind":4,"uncompress":false,"functions":[],"constants":[],"ProxyFiles":[],"copyToTargets":0,"usesRunnerInterface":false,"order":[],},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","filename":"libxprocess.gml","origname":"","init":"libxprocess_init","final":"","kind":2,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"libxprocess_init","externalName":"libxprocess_init","kind":2,"help":"libxprocess_init()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"execute_shell","externalName":"execute_shell","kind":2,"help":"execute_shell(prog,arg)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"execute_program","externalName":"execute_program","kind":2,"help":"execute_program(prog,arg,wait)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_enable_stddesc","externalName":"file_text_enable_stddesc","kind":2,"help":"file_text_enable_stddesc(enable)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_open_write_stdin","externalName":"file_text_open_write_stdin(pid)","kind":2,"help":"file_text_open_write_stdin(pid)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_write_string_stdin","externalName":"file_text_write_string_stdin(file,","kind":2,"help":"file_text_write_string_stdin(file,str)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_close_stdin","externalName":"file_text_close_stdin(file)","kind":2,"help":"file_text_close_stdin(file)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_open_read_stdout","externalName":"file_text_open_read_stdout","kind":2,"help":"file_text_open_read_stdout(pid)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_read_string_stdout","externalName":"file_text_read_string_stdout","kind":2,"help":"file_text_read_string_stdout(file)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_close_stdout","externalName":"file_text_close_stdout","kind":2,"help":"file_text_close_stdout(file)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":194,"usesRunnerInterface":false,"order":[
        {"name":"libxprocess_init","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"execute_shell","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"execute_program","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_enable_stddesc","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_open_write_stdin","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_write_string_stdin","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_close_stdin","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_open_read_stdout","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_read_string_stdout","path":"extensions/libxprocess/libxprocess.yy",},
        {"name":"file_text_close_stdout","path":"extensions/libxprocess/libxprocess.yy",},
      ],},
  ],
  "classname": "",
  "tvosclassname": null,
  "tvosdelegatename": null,
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 194,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
}