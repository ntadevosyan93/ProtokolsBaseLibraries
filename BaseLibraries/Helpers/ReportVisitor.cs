using BaseLibraries.Abstractions;
using BaseLibraries.Interfaces;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BaseLibraries.Helpers
{
    public class ReportVisitor
    {
        object _model { get; set; }

        public Node RootNode { get; private set; }

        public ReportVisitor(object model)
        {
            _model = model;
            RootNode = new Node();

            Type type = _model.GetType();
            RootNode.Caption = "root";

            foreach (PropertyInfo pi in type.GetProperties())
            {
                Build(pi, RootNode);
            }

            var cnt = RootNode.Nested;
        }

        public void Build(PropertyInfo pi, Node parent)
        {
            var attr = pi.GetCustomAttribute<ReportField>(false);
            if (attr != null)
            {
                var child = new Node
                {
                    Caption = attr.Name,
                    PropertyName = pi.Name,
                    ValueType = pi.PropertyType,
                    ParentNode = parent
                };

                if (pi.PropertyType.GetInterfaces().Contains(typeof(IPremitive)))
                {
                    foreach (var p in pi.PropertyType.GetProperties())
                    {
                        Build(p, child);
                    }
                }


                if (pi.PropertyType.GetInterfaces().Contains(typeof(IEnumerable)))
                {
                    var a = pi.GetType();
                }

                parent.Nested.Add(child);
            }
        }

        public class Node : NodeBase, IParentNode<Node>
        {
            public Node()
            {
                Nested = new List<Node>();
            }
            public Node ParentNode { get; set; }
            public List<Node> Nested { get; set; }
            string _nodePath;
            public string FullProperty { get {
                    _nodePath = string.Empty;
                    GetNodePath(this);
                    _nodePath = _nodePath.Trim('.');
                    return string.Join(".", _nodePath.Split('.').Reverse());
                }
            }

            private void GetNodePath(Node node)
            {
                if (node == null) return;
                _nodePath += "." + node.PropertyName;
                GetNodePath(node.ParentNode);
            }

        }


        public class NodeBase
        {
            public string PropertyName { get; set; }
            public string Caption { get; set; }
            public Type ValueType { get; set; }
            public bool IsIEnumerable { get; set; }

            public override string ToString()
            {
                return Caption;
            }
        }
    }

    
   
}
