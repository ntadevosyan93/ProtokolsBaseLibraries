using BaseLibraries.Abstractions.Models.iClinic;
using System;
using System.Collections.Generic;

namespace BaseLibraries.Interfaces
{
    public delegate void UndoRedoHandler();

    public interface IPresenter: IDisposable
    {
        event EventHandler OnBuildDocumentComplite;
        event EventHandler OnExit;
        event UndoRedoHandler OnDisableUndoRedo;
        event UndoRedoHandler OnEnableUndoRedo;
        bool IsAbort { get; }

        void ShowEditor();
        
        void BuildFullDocument();

        void BuildPatientDocument();

        void Save();
        
        void FinishProtocol();
        
        bool Validate();

        void InsertTemplateText(string text);

        void InsertMkbValues(IEnumerable<IMkb10> mkb10s);

        void InsertServices(IEnumerable<IServiceView> services);

        void InsertPharms(IEnumerable<IPharm> pharms);

        void ExportToPdf(string fileName);

        void Undo();

        void Redo();

        void DisableUndoRedo();

        void EnableUndoRedo();

        void PrintRefToMedApp();

        void UnLock();
    }
}
