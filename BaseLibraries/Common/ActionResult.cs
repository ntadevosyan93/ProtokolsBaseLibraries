namespace BaseLibraries.Common
{
    public class ActionResult
    {
        public ActionResult(string error)
        {
            HaError = true;
            Message = error;
        }
        public ActionResult()
        {
            HaError = false;
        }

        public bool HaError { get; internal set; }
        public string Message { get; internal set; }
    }

    public class ErrorResult : ActionResult
    {
        public ErrorResult(string error)
        {
            HaError = true;
            Message = error;
        }
    }

    public class ResultOk : ActionResult
    {
        public ResultOk()
        {
            HaError = false;
        }
    }


    public class ActionResult<TValueType> : ActionResult where TValueType : class
    {
        public ActionResult(TValueType value)
        {
            HaError = false;
            Value = value;
        }

        public ActionResult(string error) : base(error) { }

        public TValueType Value { get; set; }
    }
}
