import Image from "next/image";
import useQuiosco from "@/hooks/useQuiosco";

const Categoria = ({categoria}) => {
    const {categoriaActual, handleclickCategoria} = useQuiosco()

    const {nombre, icono, id} = categoria
    return ( 
        <div className={`${
            categoriaActual?.id === id ? 'bg-amber-400' : ""}
            flex items-center gap-4 w-full border p-5 hover:bg-amber-400`}>
            <Image
                width={70}
                height={70}
                alt="Imagen Icono"
                src={`assets/img/icono_${icono}.svg`}
                className="mr-5"
            />
            <button 
                type="button" 
                className="text-2xl font-bold hover:cursor-pointer" 
                onClick={() => handleclickCategoria(id)}
                >
                {nombre}
            </button>
        </div>
     );
}
 
export default Categoria;