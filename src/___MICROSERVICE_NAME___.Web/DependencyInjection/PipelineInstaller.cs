using ___MICROSERVICE_NAME___.Application;
using ___MICROSERVICE_NAME___.Infrastructure;
using EasyDesk.CleanArchitecture.Web.DependencyInjection;
using System;

namespace ___MICROSERVICE_NAME___.Web.DependencyInjection
{
    public class PipelineInstaller : PipelineInstallerBase
    {
        protected override Type ApplicationAssemblyMarker => typeof(ApplicationMarker);

        protected override Type InfrastructureAssemblyMarker => typeof(InfrastructureMarker);

        protected override Type WebAssemblyMarker => typeof(Startup);

        protected override bool UsesPublisher => false;

        protected override bool UsesConsumer => false;
    }
}
