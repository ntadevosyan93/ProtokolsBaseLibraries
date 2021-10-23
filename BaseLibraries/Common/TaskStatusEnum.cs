using System.ComponentModel;

namespace BaseLibraries.Common
{
    public enum TaskStatus : short
    {
        [Description("Новый")]
        New = 1,

        [Description("В работе")]
        InWork = 2,

        [Description("Завершено")]
        Complite = 3,

        [Description("Возврат на стороне 1С")]
        Reject1С = 4,

        [Description("Предварительно")]
        PreComplite = 5,

        [Description("Сброс Протокола")]
        RejectInProtocol = 6,

        [Description("Сброс Протокола, с возвратом в 1С")]
        RejectWith1C = 7
    }
}

namespace BaseLibraries.Common.MH
{
    public enum TaskStatus : short
    {
        /// <summary>
        /// 1. Оформлен договор
        /// </summary>
        [Description("Оформлен договор")]
        TheContractIsExecuted = 1,

        /// <summary>
        /// 2. Поступила в род.дом
        /// </summary>
        [Description("Поступила в род.дом")]
        EnteredTheMaternityHospital = 2,

        /// <summary>
        /// 3. В род.зале
        /// </summary>
        [Description("В род.зале")]
        InTheDeliveryRoom = 3,

        /// <summary>
        /// 4. После род.период
        /// </summary>
        [Description("После род.период")]
        ThePostpartumPeriod = 4,

        /// <summary>
        /// 5. Выписана
        /// </summary>
        [Description("Выписана")]
        Discharged = 5
    }
}
