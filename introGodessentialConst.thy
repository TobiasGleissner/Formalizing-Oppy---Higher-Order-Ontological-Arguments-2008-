(*<*)
theory introGodessentialConst
imports entailment
begin
(*>*)

axiomatization where T: "T_sem"
axiomatization where S5: "S5_sem"

consts godessential :: "(\<mu> \<Rightarrow> \<sigma>) \<Rightarrow> \<sigma>"
  
abbreviation godlike :: "\<mu> \<Rightarrow> \<sigma>" 
  where "godlike x \<equiv> \<^bold>\<forall>P. godessential P \<^bold>\<rightarrow> \<^bold>\<box> (P x)"

axiomatization 
  where godessentialex: "\<lfloor>(\<^bold>\<exists>P. godessential P)\<rfloor>"

theorem
assumes "\<lfloor>\<^bold>\<exists>x. godlike x\<rfloor>"
shows "\<lfloor>(\<^bold>\<exists>P. \<^bold>\<not> godessential P) \<^bold>\<and> closed godessential\<rfloor>"
nitpick[user_axioms]
oops

theorem 
assumes "\<lfloor>(\<^bold>\<exists>P. \<^bold>\<not> godessential P) \<^bold>\<and> closed godessential\<rfloor>"
shows "\<lfloor>\<^bold>\<diamond>(\<^bold>\<exists>x. godlike x)\<rfloor>"
nitpick[user_axioms] 
oops

lemma "\<lfloor>(\<^bold>\<forall>x. (\<^bold>\<forall>Q. (godessential Q) \<^bold>\<rightarrow> \<^bold>\<box>(Q x)) \<^bold>\<rightarrow> (godlike x))\<rfloor>" sledgehammer[remote_leo2]
by blast

(*<*)
end
(*>*)
